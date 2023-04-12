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
    @IBOutlet weak var identityNumberTextfield: UITextField!
    @IBOutlet weak var totalPriceLabel: UILabel!
    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBOutlet weak var nameLastNameTextField: UITextField!
    @IBOutlet weak var payAndBookButton: UIButton!
    @IBOutlet weak var paymentView: UIView!
    @IBOutlet weak var departureTimeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var routeLabel: UILabel!
    @IBOutlet weak var firmImageView: UIImageView!
    @IBOutlet weak var communicationView: UIView!
    @IBOutlet weak var passengerView: UIView!
    @IBOutlet weak var mailTextField: UITextField!
    @IBOutlet weak var numberTextField: UITextField!
    var passengerInfo: PassengerInfoModel?
    var selectedSeats = [SeatStub]()
    
    override func viewWillAppear(_ animated: Bool) {
        handleReceivedData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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

    func configureViews() {
        
        communicationView.layer.borderColor = UIColor(named: Constants.ColorNames.primary.rawValue)?.cgColor
        mailTextField.layer.borderColor = UIColor.systemGray4.cgColor
        numberTextField.layer.borderColor = UIColor.systemGray4.cgColor
        nameLastNameTextField.layer.borderColor = UIColor.systemGray4.cgColor
        identityNumberTextfield.layer.borderColor = UIColor.systemGray4.cgColor
        passengerView.layer.borderColor = UIColor(named: Constants.ColorNames.primary.rawValue)?.cgColor
        paymentView.layer.borderColor = UIColor(named: Constants.ColorNames.primary.rawValue)?.cgColor
    }
    
    @IBAction func backButtonAction(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true)
    }
    
    func handleReceivedData() {
        if passengerInfo != nil {
            firmImageView.image = passengerInfo?.firmImage
            departureTimeLabel.text = passengerInfo?.departureTime
            priceLabel.text = passengerInfo?.price
            dateLabel.text = passengerInfo?.date
            routeLabel.text = passengerInfo?.route
            selectedSeats = passengerInfo!.selectedSeats
            totalPriceLabel.text = "\(String(describing: (passengerInfo!.price.getPriceInt()! * selectedSeats.count))) TL"
        }
    }
    
    @IBAction func payAndBookButtonAction(_ sender: Any) {

        if creditCardNoTextField.text?.isEmpty == true ||
            creditCardExpirationDateTextField.text?.isEmpty == true ||
            creditCardCCVTextField.text?.isEmpty == true ||
            mailTextField.text?.isEmpty == true ||
            numberTextField.text?.isEmpty == true ||
            nameLastNameTextField.text?.isEmpty == true ||
            identityNumberTextfield.text?.isEmpty == true {
            self.showAlert(title: "Error", message: "Fill all the blank spaces please!")
            return
        }

        let ticketModel = TicketModel(selectedSeats: selectedSeats, phoneNumber: numberTextField.text!, mail: mailTextField.text!, price: priceLabel.text!, totalPrice: totalPriceLabel.text!, date: dateLabel.text!, departureTime: departureTimeLabel.text!, route: routeLabel.text!, nameLastName: nameLastNameTextField.text!, identityNumber: identityNumberTextfield.text!)

        if var ticketDataArray = UserDefaults.standard.array(forKey: Constants.UserDefaultsKeys.ticketData.rawValue) as? [Data] {
            if let ticketData = ticketModel.toData() {
                ticketDataArray.append(ticketData)
                UserDefaults.standard.set(ticketDataArray, forKey: Constants.UserDefaultsKeys.ticketData.rawValue)
                
                let alertController = UIAlertController(title: "Booking Successful", message: "Press OK to see your tickets.", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
                    let destinationVC = self.storyboard?.instantiateViewController(withIdentifier: Constants.VCIdentifiers.MyTicketsVC.rawValue) as! MyTicketsViewController
                    destinationVC.modalPresentationStyle = .fullScreen
                    self.present(destinationVC, animated: true, completion: nil)
                }
                alertController.addAction(okAction)
                self.present(alertController, animated: true, completion: nil)
                
            } else {
                print("Failed to convert ticket model to data")
            }
        } else {
            if let ticketData = ticketModel.toData() {
                let ticketDataArray: [Data] = [ticketData]
                UserDefaults.standard.set(ticketDataArray, forKey: Constants.UserDefaultsKeys.ticketData.rawValue)
            } else {
                print("Failed to convert ticket model to data")
            }
        }
    }
}


