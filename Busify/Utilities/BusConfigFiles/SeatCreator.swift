//
//  SeatCreator.swift
//  Busify
//
//  Created by Kerem Ersu on 4.04.2023.
//

import Foundation

struct SeatStub: Codable {
    let id: String
    let number: Int
    let salable: Bool
    var gender: Bool
    let hall: Bool
}

class MockSeatCreater {
    
    func create(count: Int) -> [SeatStub] {
        var list = [SeatStub]()
        (1...count).forEach { (count) in
            let isHall = (count - 2) % 5 == 1
            let stub = SeatStub(id: UUID().uuidString,
                                number: count,
                                salable: Bool.random(),
                                gender: Bool.random(),
                                hall: isHall)
            list.append(stub)
        }
        return list
    }
    
}
