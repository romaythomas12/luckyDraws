//
//  LotterySystemTests.swift
//  LuckyDrawsTests
//
//  Created by Thomas Romay on 09/09/2024.
//

@testable import LuckyDraws
import Testing

@MainActor
struct LotterySystemTests {
    // Test generateTicket
    @MainActor
    @Test func testGenerateTicket() {
        // Arrange
        let expectedTicket = LotteryTicket(numbers: [1, 2, 3, 4, 5, 6], bonusBalls: [7])
        let mockTicketGenerator = MockTicketGenerator(mockTicket: expectedTicket)
        let mockTicketValidator = MockTicketValidator()
        let lotterySystem = makeSUT(ticketGenerator: mockTicketGenerator, ticketValidator: mockTicketValidator)

        // Act
        let generatedTicket = lotterySystem.generateTicket(maxRange: 10, count: 6, bonusBall: 1)

        // Assert
        #expect(generatedTicket == expectedTicket, "The generated ticket should match the expected ticket.")
    }

    // Test validateTicket
    @MainActor
    @Test func testValidateTicket() {
        // Arrange
        let mockTicketGenerator = MockTicketGenerator()
        let mockTicketValidator = MockTicketValidator()
        let lotterySystem = makeSUT(ticketGenerator: mockTicketGenerator, ticketValidator: mockTicketValidator)

        let ticket = LotteryTicket(numbers: [1, 2, 3, 4, 5, 6], bonusBalls: [7])
        let draw = LotteryDrawStub.draw5
        mockTicketValidator.mockMatchedNumbers = [1, 2, 3, 4, 5, 6]
        mockTicketValidator.mockMatchedBonusBalls = [7]

        // Act
        let validationResult = lotterySystem.validateTicket(ticket: ticket, draw: draw)

        // Assert
        #expect(validationResult.matchedNumbers == [1, 2, 3, 4, 5, 6], "The matched numbers should be correct.")
        #expect(validationResult.matchedBonusBalls == [7], "The matched bonus balls should be correct.")
    }

    // MARK: - Private Functions

    private func makeSUT(ticketGenerator: TicketGeneratorProtocol, ticketValidator: TicketValidatorProtocol) -> LotterySystem {
        return LotterySystem(ticketGenerator: ticketGenerator, ticketValidator: ticketValidator)
    }
}
