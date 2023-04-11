//
//  String + getPriceInt.swift
//  Busify
//
//  Created by Kerem Ersu on 11.04.2023.
//

import Foundation

extension String {
    func getPriceInt() -> Int? {
        let decimalCharacterSet = CharacterSet.decimalDigits
        let filteredString = self.unicodeScalars.filter { decimalCharacterSet.contains($0) }
        let extractedNumber = String(filteredString)
        return Int(extractedNumber)
    }
}
