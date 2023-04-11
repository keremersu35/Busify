//
//  PassengerInfoCell.swift
//  Busify
//
//  Created by Kerem Ersu on 9.04.2023.
//

import UIKit

class PassengerInfoCell: UICollectionViewCell {

    
    @IBOutlet weak var passengerNoLabel: UILabel!
    @IBOutlet weak var seatNoLabel: UILabel!
    @IBOutlet weak var passengerIcon: UIImageView!
    @IBOutlet weak var nameLastnameTextField: UITextField!
    @IBOutlet weak var identityNumberTextField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setup(_ model: PassengerInfoCellModel) {
        
        passengerNoLabel.text = "Passenger \(model.passangerNo + 1)"
        seatNoLabel.text = "(Seat No: \(model.seatNo))"
        contentView.layer.borderColor = UIColor.systemGray4.cgColor
        nameLastnameTextField.layer.borderColor = UIColor.systemGray4.cgColor
        identityNumberTextField.layer.borderColor = UIColor.systemGray4.cgColor
    }
}
