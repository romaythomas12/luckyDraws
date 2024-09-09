//
//  MockTicketValidator.swift
//  LuckyDrawsTests
//
//  Created by Thomas Romay on 09/09/2024.
//

import Foundation
@testable import LuckyDraws
class MockTicketValidator: TicketValidatorProtocol {
    var mockMatchedNumbers: [Int] = []
    var mockMatchedBonusBalls: [Int] = []

    func checkTicketAgainstDraw(ticket: LotteryTicket, draw: LotteryDrawProtocol) -> (matchedNumbers: [Int], matchedBonusBalls: [Int]) {
        return (mockMatchedNumbers, mockMatchedBonusBalls)
    }
}
