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
    let cities = ["İstanbul", "İzmir", "Ankara", "Adana", "Adıyaman", "Afyonkarahisar", "Ağrı", "Amasya", "Antalya", "Artvin", "Aydın", "Balıkesir", "Bilecik", "Bingöl", "Bitlis", "Bolu", "Burdur", "Bursa", "Çanakkale", "Çankırı", "Çorum", "Denizli", "Diyarbakır", "Edirne", "Elazığ", "Erzincan", "Erzurum", "Eskişehir", "Gaziantep", "Giresun", "Gümüşhane", "Hakkari", "Hatay", "Isparta", "Mersin", "Kars", "Kastamonu", "Kayseri", "Kırklareli", "Kırşehir", "Kocaeli", "Konya", "Kütahya", "Malatya", "Manisa", "Kahramanmaraş", "Mardin", "Muğla", "Muş", "Nevşehir", "Niğde", "Ordu", "Rize", "Sakarya", "Samsun", "Siirt", "Sinop", "Sivas", "Tekirdağ", "Tokat", "Trabzon", "Tunceli", "Şanlıurfa", "Uşak", "Van", "Yozgat", "Zonguldak", "Aksaray", "Bayburt", "Karaman", "Kırıkkale", "Batman", "Şırnak", "Bartın", "Ardahan", "Iğdır", "Yalova", "Karabük", "Kilis", "Osmaniye", "Düzce"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let myImage = UIImage(systemName: "location"){
            fromTextField.withImage(direction: .Left, image: myImage, colorSeparator: UIColor.white, colorBorder: UIColor.white)
        }
        fromTextField.layer.borderColor = UIColor.placeholderText.cgColor
        if let myImage = UIImage(systemName: "location.fill"){
            toTextField.withImage(direction: .Left, image: myImage, colorSeparator: UIColor.white, colorBorder: UIColor.white)
        }
        toTextField.layer.borderColor = UIColor.placeholderText.cgColor
        if let myImage = UIImage(systemName: "calendar"){
            dateTextField.withImage(direction: .Left, image: myImage, colorSeparator: UIColor.white, colorBorder: UIColor.white)
        }
        dateTextField.layer.borderColor = UIColor.placeholderText.cgColor

        configurePickers()
        createDatePicker()
    }
    
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
        performSegue(withIdentifier: "selectionToTicketsSegue", sender: self)
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
    }
    
    func createDatePicker() {
        formatter.dateStyle = .medium
        formatter.dateFormat = "dd.MM.yyyy"
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: nil, action: #selector(doneButtonClicked))
        toolbar.setItems([doneButton], animated: true)
        dateTextField.inputAccessoryView = toolbar
        dateTextField.inputView = datePicker
        datePicker.datePickerMode = .date
        datePicker.minimumDate = .now
        datePicker.preferredDatePickerStyle = .wheels
        }
    
    @objc func doneButtonClicked() {
        dateTextField.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
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
            fromTextField.resignFirstResponder()
        case 2:
            toTextField.text = cities[row]
            toTextField.resignFirstResponder()
        default:
            print("")
        }
    }
}
