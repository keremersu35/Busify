//
//  String + formatCreditCardExpiry.swift
//  Busify
//
//  Created by Kerem Ersu on 11.04.2023.
//

import Foundation

extension String {
    func formatCreditCardExpiryDate() -> String {
        var formattedString: String = ""
        let inputString = self.replacingOccurrences(of: "/", with: "")
        
        if inputString.count > 0 {
            if inputString.count > 2 {
                let index = inputString.index(inputString.startIndex, offsetBy: 2)
                let firstTwoChars = inputString[..<index]
                let remainingChars = inputString[index...]
                formattedString = "\(firstTwoChars)/\(remainingChars)"
            } else {
                formattedString = inputString
            }
        }
        return formattedString
    }
}

extension String {
    func insertingSpacesEvery(n: Int) -> String {
        var result = ""
        var index = 0
        let trimmed = self.filter { $0 != " " }
        for char in trimmed {
            if index > 0 && index % n == 0 {
                result.append(" ")
            }
            result.append(char)
            index += 1
        }
        return result
    }
}

