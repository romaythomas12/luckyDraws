//
//  TicketValidator.swift
//  LuckyDraws
//
//  Created by Thomas Romay on 09/09/2024.
//

import Foundation
protocol TicketValidatorProtocol {
    func checkTicketAgainstDraw(ticket: LotteryTicket, draw: LotteryDrawProtocol) -> (matchedNumbers: [Int], matchedBonusBalls: [Int])
}

class TicketValidator: TicketValidatorProtocol {
    func checkTicketAgainstDraw(ticket: LotteryTicket, draw: LotteryDrawProtocol) -> (matchedNumbers: [Int], matchedBonusBalls: [Int]) {
        let drawNumbers = [draw.number1, draw.number2, draw.number3, draw.number4, draw.number5, draw.number6]
            .compactMap { $0 }
            .compactMap { Int($0) }

        let matchedNumbers = ticket.numbers.filter { drawNumbers.contains($0) }

        let matchedBonusBalls = ticket.bonusBalls.filter { draw.bonusBalls.compactMap { Int($0) }.contains($0) }

        return (matchedNumbers, matchedBonusBalls)
    }
}
