//
//  TicketCell.swift
//  Busify
//
//  Created by Kerem Ersu on 4.04.2023.
//

import UIKit
import ALBusSeatView
import Foundation

class TicketCell: UITableViewCell {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var firmImageView: UIImageView!
    @IBOutlet weak var destinationLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var departureTimeLabel: UILabel!
    @IBOutlet weak var seatView: ALBusSeatView!
    var seatDataManager = SeatDataManager()
    var first = [SeatStub]()
    var selectedSeatCount:Int = 0
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
        seatView?.config = BusSeatConfig()
        seatView?.delegate = seatDataManager
        seatView?.dataSource = seatDataManager
        
        let mock = MockSeatCreater()
        
        first = mock.create(count: 45)
        seatDataManager.seatList = [first]
        seatView?.reload()

        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowOffset = CGSize(width: 0, height: 3)
        contentView.layer.shadowRadius = 2
        contentView.layer.shadowOpacity = 0.2
        contentView.layer.masksToBounds = false
    }
    
    func setup(_ model: TicketCellModel) {
        if (model.isHidden) {
            seatView.removeConstraints(seatView.constraints)
        } else {
            seatView.heightAnchor.constraint(equalToConstant: 210).isActive = true
            NSLayoutConstraint.activate([
             seatView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
             seatView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -48),
             seatView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
            ])
        }
        self.firmImageView.image = model.image
        self.dateLabel.text = String(describing: model.date)
        self.priceLabel.text = "\(model.price) TL"
        self.seatView.isHidden = model.isHidden
        self.destinationLabel.text = model.destination
        self.departureTimeLabel.text = model.departureTime
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 4, left: 8, bottom: 4, right: 8))
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.imageView?.image = nil
        self.dateLabel?.text = nil
        self.priceLabel?.text = nil
        self.destinationLabel?.text = nil
        self.departureTimeLabel?.text = nil
        seatView.heightAnchor.constraint(equalToConstant: 210).isActive = true
        NSLayoutConstraint.activate([
         seatView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
         seatView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -48),
         seatView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
    }
}
