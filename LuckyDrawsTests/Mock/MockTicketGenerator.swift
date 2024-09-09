//
//  MockTicketGenerator.swift
//  LuckyDrawsTests
//
//  Created by Thomas Romay on 09/09/2024.
//
@testable import LuckyDraws
class MockTicketGenerator: TicketGeneratorProtocol {
    let mockTicket: LotteryTicket?
    init(mockTicket: LotteryTicket? = nil) {
        self.mockTicket = mockTicket
    }

    func generateRandomTicket(numberRange: ClosedRange<Int>, numberCount: Int, bonusBallCount: Int) -> LotteryTicket {
        return mockTicket ?? LotteryTicket(numbers: [], bonusBalls: [])
    }
}
