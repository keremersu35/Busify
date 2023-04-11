//
//  PaymentViewController.swift
//  Busify
//
//  Created by Kerem Ersu on 8.04.2023.
//

import UIKit

class PaymentViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var creditCardNoTextField: UITextField!
    @IBOutlet weak var creditCardExpirationDateTextField: UITextField!
    @IBOutlet weak var creditCardCCVTextField: UITextField!
    @IBOutlet weak var totalPriceLabel: UILabel!
    @IBOutlet weak var payAndBookButton: UIButton!
    @IBOutlet weak var paymentView: UIView!
    @IBOutlet weak var departureTimeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var routeLabel: UILabel!
    @IBOutlet weak var firmImageView: UIImageView!
    @IBOutlet weak var communicationView: UIView!
    @IBOutlet weak var passengerView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var mailTextField: UITextField!
    @IBOutlet weak var numberTextField: UITextField!
    var ticketModel: TicketModel?
    var selectedSeats = [SeatStub]()
    
    override func viewWillAppear(_ animated: Bool) {
        handleReceivedData()
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureCollectionView()
        creditCardExpirationDateTextField.delegate = self
        configureViews()
    }
}

extension PaymentViewController {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

           if string == "" { return true }

           let currentText = textField.text! as NSString
           let updatedText = currentText.replacingCharacters(in: range, with: string)

           textField.text = updatedText
           let numberOfCharacters = updatedText.count
           if numberOfCharacters == 2 {
               textField.text?.append("/")
           }
          return false
       }

    func configureCollectionView() {
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func configureViews() {
        
        communicationView.layer.borderColor = UIColor(named: Constants.ColorNames.primary.rawValue)?.cgColor
        mailTextField.layer.borderColor = UIColor.systemGray4.cgColor
        numberTextField.layer.borderColor = UIColor.systemGray4.cgColor
        passengerView.layer.borderColor = UIColor(named: Constants.ColorNames.primary.rawValue)?.cgColor
        paymentView.layer.borderColor = UIColor(named: Constants.ColorNames.primary.rawValue)?.cgColor
    }
    
    func handleReceivedData() {
        if ticketModel != nil {
            firmImageView.image = ticketModel?.firmImage
            departureTimeLabel.text = ticketModel?.departureTime
            priceLabel.text = ticketModel?.price
            dateLabel.text = ticketModel?.date
            routeLabel.text = ticketModel?.route
            selectedSeats = ticketModel!.selectedSeats
            totalPriceLabel.text = "\(String(describing: (ticketModel!.price.getPriceInt()! * selectedSeats.count))) TL"
        }
    }
    
    @IBAction func payAndBookButtonAction(_ sender: Any) {
        
        if creditCardNoTextField.text?.isEmpty == true ||
            creditCardExpirationDateTextField.text?.isEmpty == true ||
            creditCardCCVTextField.text?.isEmpty == true ||
            mailTextField.text?.isEmpty == true ||
            numberTextField.text?.isEmpty == true {

            self.showAlert(title: "Error", message: "Fill all the blank spaces please!")
            return
        }
    }
}

extension PaymentViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        selectedSeats.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.NibNames.passengerInfoCell.rawValue, for: indexPath) as! PassengerInfoCell
        cell.setup(PassengerInfoCellModel(passangerNo: indexPath.row, seatNo: selectedSeats[indexPath.row].number))
        return cell
    }
}


