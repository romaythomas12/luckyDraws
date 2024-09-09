//
//  MyTicketsViewModelTests.swift
//  LuckyDrawsTests
//
//  Created by Thomas Romay on 09/09/2024.
//
@testable import LuckyDraws
import Testing

struct MyTicketsViewModelTests {
    @Test func testGenerateAndValidateTicket() async {
        // Arrange
        let mockTicket = LotteryTicket(numbers: [2, 16, 23, 44, 47, 52], bonusBalls: [14])
        let mockTicketGenerator = MockTicketGenerator(mockTicket: mockTicket)
        let lotterySystem = LotterySystem(ticketGenerator: mockTicketGenerator, ticketValidator: TicketValidator())
        
        let viewModel = MyTicketsViewModel(lotterySystem: lotterySystem, draw: LotteryDrawStub.draw6)
        
        // Act
        
        viewModel.generateTicket()
 
        // Assert
        #expect(viewModel.generatedTicket != nil, "A ticket should be generated")
        
        #expect(viewModel.matchedNumbers.count == 6, "All numbers should match in this mock setup")
        #expect(viewModel.matchedBonusBalls.count == 1, "One bonus ball should match")
    }
}
