//
//  LotterySystem.swift
//  LuckyDraws
//
//  Created by Thomas Romay on 09/09/2024.
//

import Foundation
class LotterySystem {
    private let ticketGenerator: TicketGeneratorProtocol
    private let ticketValidator: TicketValidatorProtocol
    
    init(ticketGenerator: TicketGeneratorProtocol, ticketValidator: TicketValidatorProtocol) {
        self.ticketGenerator = ticketGenerator
        self.ticketValidator = ticketValidator
    }
    
    func generateTicket(maxRange: Int = 59, count: Int = 6, bonusBall: Int = 1) -> LotteryTicket {
        return ticketGenerator.generateRandomTicket(numberRange: 1 ... maxRange, numberCount: count, bonusBallCount: bonusBall)
    }
    
    func validateTicket(ticket: LotteryTicket, draw: LotteryDrawProtocol) -> (matchedNumbers: [Int], matchedBonusBalls: [Int]) {
        return ticketValidator.checkTicketAgainstDraw(ticket: ticket, draw: draw)
    }
}
