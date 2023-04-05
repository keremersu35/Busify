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
    @IBOutlet weak var seatView: ALBusSeatView! {
        didSet {
            seatView.isHidden = true
        }
    }
    var dataManager = SeatDataManager()
    var first = [SeatStub]()
    var selectedSeatCount:Int = 0
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
        seatView?.config = BusSeatConfig()
        seatView?.delegate = dataManager
        seatView?.dataSource = dataManager
        
        let mock = MockSeatCreater()
        
        first = mock.create(count: 45)
        dataManager.seatList = [first]
        seatView?.reload()

        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowOffset = CGSize(width: 0, height: 3)
        contentView.layer.shadowRadius = 2
        contentView.layer.shadowOpacity = 0.2
        contentView.layer.masksToBounds = false
    }
    
    func setup(_ model: TicketCellModel) {
        
        if (model.isHidden) {
            self.seatView.heightAnchor.constraint(equalToConstant: 0).isActive = true
        } else {
            self.seatView.heightAnchor.constraint(equalToConstant: 210).isActive = true
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
}
