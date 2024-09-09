//
//  TicketGeneratorTests.swift
//  LuckyDrawsTests
//
//  Created by Thomas Romay on 09/09/2024.
//
@testable import LuckyDraws
import Testing

struct TicketGeneratorTests {
    @MainActor
    @Test func testGenerateRandomTicket() {
        // Arrange
        let ticketGenerator = TicketGenerator()
        
        // Act
        let ticket = ticketGenerator.generateRandomTicket(numberRange: 1 ... 59, numberCount: 6, bonusBallCount: 1)
        
        // Assert
        #expect(ticket.numbers.count == 6, "Should generate 6 numbers")
        #expect(ticket.bonusBalls.count == 1, "Should generate 1 bonus ball")
        
        #expect(ticket.numbers.allSatisfy { $0 >= 1 && $0 <= 59 }, "Numbers should be within 1 to 59")
        #expect(ticket.bonusBalls.allSatisfy { $0 >= 1 && $0 <= 59 }, "Bonus ball should be within 1 to 59")
    }
}
