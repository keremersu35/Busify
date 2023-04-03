//
//  TicketSelectionViewController.swift
//  Busify
//
//  Created by Kerem Ersu on 2.04.2023.
//

import UIKit

class TicketSelectionViewController: UIViewController {
    
    @IBOutlet weak var toTextField: UITextField!
    @IBOutlet weak var fromTextField: UITextField!
    var cityPicker = UIPickerView()
    var destinationCityPicker = UIPickerView()
    
    let cities = ["İstanbul", "İzmir", "Ankara", "Adana", "Adıyaman", "Afyonkarahisar", "Ağrı", "Amasya", "Antalya", "Artvin", "Aydın", "Balıkesir", "Bilecik", "Bingöl", "Bitlis", "Bolu", "Burdur", "Bursa", "Çanakkale", "Çankırı", "Çorum", "Denizli", "Diyarbakır", "Edirne", "Elazığ", "Erzincan", "Erzurum", "Eskişehir", "Gaziantep", "Giresun", "Gümüşhane", "Hakkari", "Hatay", "Isparta", "Mersin", "Kars", "Kastamonu", "Kayseri", "Kırklareli", "Kırşehir", "Kocaeli", "Konya", "Kütahya", "Malatya", "Manisa", "Kahramanmaraş", "Mardin", "Muğla", "Muş", "Nevşehir", "Niğde", "Ordu", "Rize", "Sakarya", "Samsun", "Siirt", "Sinop", "Sivas", "Tekirdağ", "Tokat", "Trabzon", "Tunceli", "Şanlıurfa", "Uşak", "Van", "Yozgat", "Zonguldak", "Aksaray", "Bayburt", "Karaman", "Kırıkkale", "Batman", "Şırnak", "Bartın", "Ardahan", "Iğdır", "Yalova", "Karabük", "Kilis", "Osmaniye", "Düzce"]

    override func viewDidLoad() {
        super.viewDidLoad()

        configurePickers()
        navigationController?.navigationBar.prefersLargeTitles = true
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
