//
//  TicketSelectionViewController.swift
//  Busify
//
//  Created by Kerem Ersu on 2.04.2023.
//

import UIKit

class TicketSelectionViewController: UIViewController {
    
    @IBOutlet weak private var toTextField: UITextField!
    @IBOutlet weak var exchangeButton: UIButton!
    @IBOutlet weak var fromTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    private var cityPicker = UIPickerView()
    var destinationCityPicker = UIPickerView()
    let datePicker = UIDatePicker()
    let formatter = DateFormatter()
    var cities = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()

        cities = self.setCitiesList()
        configureTextFields()
        configurePickers()
        createDatePicker()
    }
}

extension TicketSelectionViewController {
    
    @IBAction func exchangeButtonAction(_ sender: UIButton) {
        (fromTextField.text, toTextField.text) = (toTextField.text, fromTextField.text)
    }
    
    @IBAction func todayButtonAction(_ sender: UIButton) {
        dateTextField.text = formatter.string(from: Date())
    }
    
    @IBAction func tomorrowButtonAction(_ sender: UIButton) {
        let tomorrow = Calendar.current.date(byAdding: .day, value: 1, to: Date())
        dateTextField.text = formatter.string(from: tomorrow!)
    }
    
    @IBAction func findTicketButtonAction(_ sender: UIButton) {
        performSegue(withIdentifier: Constants.SegueIdentifiers.selectionToTicketsSegue.rawValue, sender: self)
    }
    
    @objc func doneButtonClicked() {
        dateTextField.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    
    func configurePickers() {
        
        self.fromTextField.inputView = cityPicker
        self.toTextField.inputView = destinationCityPicker
        
        self.cityPicker.tag = 1
        self.destinationCityPicker.tag = 2
        
        self.cityPicker.delegate = self
        self.cityPicker.dataSource = self
        self.destinationCityPicker.delegate = self
        self.destinationCityPicker.dataSource = self
        
        // Add a "Done" button to the inputAccessoryView of each picker
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneButtonClickedFromPicker))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        toolbar.setItems([spaceButton, doneButton], animated: false)
        self.fromTextField.inputAccessoryView = toolbar
        self.toTextField.inputAccessoryView = toolbar
    }

    // Handle the "Done" button action for pickers
    @objc func doneButtonClickedFromPicker() {
        self.fromTextField.resignFirstResponder()
        self.toTextField.resignFirstResponder()
    }
    
    func createDatePicker() {
        formatter.dateStyle = .medium
        formatter.dateFormat = "dd.MM.yyyy"
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneButtonClicked))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolbar.setItems([spaceButton, doneButton], animated: true)
        dateTextField.inputAccessoryView = toolbar
        dateTextField.inputView = datePicker
        datePicker.datePickerMode = .date
        datePicker.minimumDate = .now
        datePicker.preferredDatePickerStyle = .wheels
        }
    
    func configureTextFields() {
        
        fromTextField.addLeadingIcon(Constants.ImageNames.location.rawValue)
        toTextField.addLeadingIcon(Constants.ImageNames.locationFill.rawValue)
        dateTextField.addLeadingIcon(Constants.ImageNames.calendar.rawValue)
        fromTextField.layer.borderColor = UIColor(named: Constants.ColorNames.primary.rawValue)?.cgColor
        toTextField.layer.borderColor = UIColor(named: Constants.ColorNames.primary.rawValue)?.cgColor
        dateTextField.layer.borderColor = UIColor(named: Constants.ColorNames.primary.rawValue)?.cgColor
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constants.SegueIdentifiers.selectionToTicketsSegue.rawValue {
            if let ticketsVC = segue.destination as? TicketsViewController {
                guard let from = fromTextField.text, let to = toTextField.text, let date = dateTextField.text else { return }
                let infoList = ["from": from, "to": to, "date": date]
                ticketsVC.ticketInfo = infoList
            }
        }
    }
}

extension TicketSelectionViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents (in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return cities.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return cities[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 1:
            fromTextField.text = cities[row]
        case 2:
            toTextField.text = cities[row]
        default:
            print("Error")
        }
    }
}
