//
//  TicketGenerator.swift
//  LuckyDraws
//
//  Created by Thomas Romay on 09/09/2024.
//

import Foundation

protocol TicketGeneratorProtocol {
    func generateRandomTicket(numberRange: ClosedRange<Int>, numberCount: Int, bonusBallCount: Int) -> LotteryTicket
}

class TicketGenerator: TicketGeneratorProtocol {
    func generateRandomTicket(numberRange: ClosedRange<Int> = 1...59, numberCount: Int = 6, bonusBallCount: Int = 1) -> LotteryTicket {
        let numbers = Array(Set((1...numberRange.count).map { _ in Int.random(in: numberRange) })).prefix(numberCount)

        let bonusBalls = Array(Set((1...numberRange.count).map { _ in Int.random(in: numberRange) })).prefix(bonusBallCount)

        return LotteryTicket(numbers: Array(numbers).sorted(), bonusBalls: Array(bonusBalls).sorted())
    }
}
