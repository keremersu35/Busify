//
//  TicketCell.swift
//  Busify
//
//  Created by Kerem Ersu on 4.04.2023.
//

import UIKit
import ALBusSeatView

class TicketCell: UITableViewCell {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var firmImageView: UIImageView!
    @IBOutlet weak var destinationLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var departureTimeLabel: UILabel!
    @IBOutlet weak var busSeatView: ALBusSeatView!
    @IBOutlet weak var bookNowButton: UIButton!
    var seatDataManager = SeatDataManager()
    let mock = MockSeatCreater()
    var randomSeatList = [SeatStub]()
     
    @IBAction func bookNowButtonActiion(_ sender: UIButton) {
        
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configBusSeatView()
    }
    
    func setup(_ model: TicketCellModel) {
        
        setCollapsedCellItems(model.isHidden)

        self.firmImageView.image = model.image
        self.dateLabel.text = String(describing: model.date)
        self.priceLabel.text = "\(model.price) TL"
        self.busSeatView.isHidden = model.isHidden
        self.bookNowButton.isHidden = model.isHidden
        self.destinationLabel.text = model.destination
        self.departureTimeLabel.text = model.departureTime
    }
    
    func seatSelected(at indexPath: IndexPath, selectionType: ALSelectionType) {
        var stub = seatDataManager.seatList[indexPath.section][indexPath.row]
        stub.gender = selectionType == .man ? true : false
        if(seatDataManager.selectedSeatlist.count >= 5) {
            
            parentViewController?.showAlert(title: "Error", message: "You can't book more than 5 seats")
        }else {
            
            seatDataManager.selectedSeatlist.append(stub)
        }
        setBookNowButtonEnable()
        busSeatView.reload()
    }
    
    func configBusSeatView() {
        
        busSeatView?.config = BusSeatConfig()
        busSeatView?.delegate = seatDataManager
        busSeatView?.dataSource = seatDataManager
        
        randomSeatList = mock.create(count: 45)
        seatDataManager.seatList = [randomSeatList]
        busSeatView?.reload()
    }
    
    func seatDeselected(at indexPath: IndexPath) {
        let stub = seatDataManager.seatList[indexPath.section][indexPath.item]
        seatDataManager.selectedSeatlist.removeAll(where: { $0.id == stub.id })
        setBookNowButtonEnable()
        busSeatView.reload()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 4, left: 8, bottom: 4, right: 8))
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowOffset = CGSize(width: 0, height: 3)
        contentView.layer.shadowRadius = 2
        contentView.layer.shadowOpacity = 0.2
        contentView.layer.masksToBounds = false
    }
    
    func setBookNowButtonEnable() {
        bookNowButton.isEnabled = !seatDataManager.selectedSeatlist.isEmpty
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.imageView?.image = nil
        self.dateLabel?.text = nil
        self.priceLabel?.text = nil
        self.destinationLabel?.text = nil
        self.departureTimeLabel?.text = nil
        setCollapsedCellItems(false)
    }
    
    func setCollapsedCellItems(_ isCollapsed: Bool) {
        if isCollapsed {
            NSLayoutConstraint.deactivate(busSeatView.constraints + bookNowButton.constraints)
        } else {
            NSLayoutConstraint.activate([
                busSeatView.heightAnchor.constraint(equalToConstant: 210),
                busSeatView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
                busSeatView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -48),
                busSeatView.bottomAnchor.constraint(equalTo: bookNowButton.topAnchor, constant: -16),
                bookNowButton.heightAnchor.constraint(equalToConstant: 35),
                bookNowButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 76.67),
                bookNowButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -76.33),
                bookNowButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
            ])
        }
    }
}
