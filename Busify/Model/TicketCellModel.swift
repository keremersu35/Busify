//
//  TicketCellModel.swift
//  Busify
//
//  Created by Kerem Ersu on 5.04.2023.
//

import Foundation
import UIKit

struct TicketCellModel {
    
    let image: UIImage
    let destination: String
    let date: String
    let price: Int
    let departureTime: String
    var isHidden: Bool
}
