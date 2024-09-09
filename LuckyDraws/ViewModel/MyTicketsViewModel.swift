//
//  MyTicketsViewModel.swift
//  LuckyDraws
//
//  Created by Thomas Romay on 09/09/2024.
//

import Foundation

class MyTicketsViewModel: ObservableObject {
    @Published var generatedTicket: LotteryTicket?
    @Published var matchedNumbers: [Int] = []
    @Published var matchedBonusBalls: [Int] = []

    private let lotterySystem: LotterySystem
    private let draw: LotteryDrawProtocol

    init(lotterySystem: LotterySystem = LotterySystem(ticketGenerator: TicketGenerator(), ticketValidator: TicketValidator()), draw: LotteryDrawProtocol) {
        self.lotterySystem = lotterySystem
        self.draw = draw
    }

    // Generate a random ticket
    func generateTicket() {
        let ticket = lotterySystem.generateTicket(count: draw.lotteryType == .lottoPlus ? 5 : 6, bonusBall: draw.lotteryType == .lottoPlus ? 2 : 1)
        generatedTicket = ticket
        validateTicket(ticket: ticket)
    }

    private func validateTicket(ticket: LotteryTicket) {
        let result = lotterySystem.validateTicket(ticket: ticket, draw: draw)
        matchedNumbers = result.matchedNumbers
        matchedBonusBalls = result.matchedBonusBalls
    }
}
