//
//  PassengerInfoModel.swift
//  Busify
//
//  Created by Kerem Ersu on 12.04.2023.
//

import Foundation
import UIKit

struct PassengerInfoModel {
    let firmImage: UIImage
    let departureTime: String
    let price: String
    let date: String
    let route: String
    let selectedSeats: [SeatStub]
}
