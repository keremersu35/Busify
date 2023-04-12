//
//  MyTicketCell.swift
//  Busify
//
//  Created by Kerem Ersu on 9.04.2023.
//

import UIKit

class MyTicketCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var totalPriceLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var destinationLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var departureTimeLabel: UILabel!
    @IBOutlet weak var seatNoLabel: UILabel!
    @IBOutlet weak var nameLastNameLabel: UILabel!

    func setup(_ model: TicketModel) {
        dateLabel.text = model.date
        departureTimeLabel.text = model.departureTime
        let seatNumbers = model.selectedSeats.map { "\($0.number)" }.joined(separator: "-")
        seatNoLabel.text = seatNumbers
        nameLastNameLabel.text = model.nameLastName
        priceLabel.text = model.price
        totalPriceLabel.text = model.totalPrice
        destinationLabel.text = model.route
    }
}

