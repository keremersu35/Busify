//
//  Date + toString.swift
//  Busify
//
//  Created by Kerem Ersu on 5.04.2023.
//

import Foundation

extension Date {
    func toString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter.string(from: self)
    }
}
