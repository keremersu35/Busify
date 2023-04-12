//
//  TicketModel.swift
//  Busify
//
//  Created by Kerem Ersu on 11.04.2023.
//

import Foundation
import UIKit

struct TicketModel: Codable {
    
    let selectedSeats: [SeatStub]
    let phoneNumber: String
    let mail: String
    let price: String
    let totalPrice: String
    let date: String
    let departureTime: String
    let route: String
    let nameLastName: String
    let identityNumber: String
}

extension TicketModel {
    func toData() -> Data? {
        do {
            let encoder = JSONEncoder()
            return try encoder.encode(self)
        } catch {
            print("Error: \(error.localizedDescription)")
            return nil
        }
    }
}
