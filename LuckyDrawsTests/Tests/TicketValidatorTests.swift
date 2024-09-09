//
//  TicketValidatorTests.swift
//  LuckyDrawsTests
//
//  Created by Thomas Romay on 09/09/2024.
//
@testable import LuckyDraws
import Testing

struct TicketValidatorTests {
    @MainActor
    @Test func testCheckTicketAgainstDraw() {
        // Arrange
        let ticketValidator = TicketValidator()
        
        let ticket = LotteryTicket(numbers: [2, 16, 23, 44, 47, 52], bonusBalls: [14])
        let draw = LotteryDrawStub.draw6
        
        // Act
        let result = ticketValidator.checkTicketAgainstDraw(ticket: ticket, draw: draw)
        
        // Assert
        #expect(result.matchedNumbers.count == 6, "Should match all 6 numbers")
        #expect(result.matchedBonusBalls.count == 1, "Should match 1 bonus ball")
    }
}
