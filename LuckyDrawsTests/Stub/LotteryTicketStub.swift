//
//  LotteryTicketStub.swift
//  LuckyDrawsTests
//
//  Created by Thomas Romay on 09/09/2024.
//

import Foundation
@testable import LuckyDraws

struct LotteryTicketStub: LotteryTicketProtocol {
    let numbers: [Int]
    let bonusBalls: [Int]

    static var ticket1: LotteryTicketStub {
        .init(numbers: [1, 2, 3, 4, 5, 6], bonusBalls: [7])
    }
}
