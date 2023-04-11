//
//  UIViewController + MockDataConfig.swift
//  Busify
//
//  Created by Kerem Ersu on 5.04.2023.
//

import UIKit

extension UIViewController {
    
    func setTicketList(_ ticketInfo: [String: String]) -> [TicketCellModel] {
        
        let destination = "\(String(describing: ticketInfo["from"]!)) > \(String(describing: ticketInfo["to"]!))"
        let date = String(describing: ticketInfo["date"]!)
        
        return [TicketCellModel(image: UIImage(named: Constants.ImageNames.pamukkale.rawValue)!, destination: destination, date: date, price: 265, departureTime: "09:00", isHidden: true),
        TicketCellModel(image: UIImage(named: Constants.ImageNames.kamilKoc.rawValue)!, destination: destination, date: date, price: 320, departureTime: "09:30", isHidden: true),
        TicketCellModel(image: UIImage(named: Constants.ImageNames.varan.rawValue)!, destination: destination, date: date, price: 250, departureTime: "10:00", isHidden: true),
        TicketCellModel(image: UIImage(named: Constants.ImageNames.uludag.rawValue)!, destination: destination, date: date, price: 230, departureTime: "11:00", isHidden: true),
        TicketCellModel(image: UIImage(named: Constants.ImageNames.istanbulKalesi.rawValue)!, destination: destination, date: date, price: 200, departureTime: "12:00", isHidden: true),
        TicketCellModel(image: UIImage(named: Constants.ImageNames.pamukkale.rawValue)!, destination: destination, date: date, price: 165, departureTime: "16:00", isHidden: true),
        TicketCellModel(image: UIImage(named: Constants.ImageNames.uludag.rawValue)!, destination: destination, date: date, price: 330, departureTime: "16:30", isHidden: true),
        TicketCellModel(image: UIImage(named: Constants.ImageNames.kamilKoc.rawValue)!, destination: destination, date: date, price: 190, departureTime: "19:00", isHidden: true),
        TicketCellModel(image: UIImage(named: Constants.ImageNames.varan.rawValue)!, destination: destination, date: date, price: 210, departureTime: "21:00", isHidden: true),]
    }
    
    func setCitiesList() -> [String] {
        
        ["İstanbul", "İzmir", "Ankara", "Adana", "Adıyaman", "Afyonkarahisar", "Ağrı", "Amasya", "Antalya", "Artvin", "Aydın", "Balıkesir", "Bilecik", "Bingöl", "Bitlis", "Bolu", "Burdur", "Bursa", "Çanakkale", "Çankırı", "Çorum", "Denizli", "Diyarbakır", "Edirne", "Elazığ", "Erzincan", "Erzurum", "Eskişehir", "Gaziantep", "Giresun", "Gümüşhane", "Hakkari", "Hatay", "Isparta", "Mersin", "Kars", "Kastamonu", "Kayseri", "Kırklareli", "Kırşehir", "Kocaeli", "Konya", "Kütahya", "Malatya", "Manisa", "Kahramanmaraş", "Mardin", "Muğla", "Muş", "Nevşehir", "Niğde", "Ordu", "Rize", "Sakarya", "Samsun", "Siirt", "Sinop", "Sivas", "Tekirdağ", "Tokat", "Trabzon", "Tunceli", "Şanlıurfa", "Uşak", "Van", "Yozgat", "Zonguldak", "Aksaray", "Bayburt", "Karaman", "Kırıkkale", "Batman", "Şırnak", "Bartın", "Ardahan", "Iğdır", "Yalova", "Karabük", "Kilis", "Osmaniye", "Düzce"]
    }
}
