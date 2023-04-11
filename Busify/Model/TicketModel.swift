//
//  TicketModel.swift
//  Busify
//
//  Created by Kerem Ersu on 11.04.2023.
//

import Foundation
import UIKit

struct TicketModel {
    
    let selectedSeats: [SeatStub]
    let price: String
    let date: String
    let departureTime: String
    let route: String
    let firmImage: UIImage
}
