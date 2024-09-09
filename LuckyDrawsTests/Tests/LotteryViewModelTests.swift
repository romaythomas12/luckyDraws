//
//  LotteryViewModelTests.swift
//  LuckyDrawsTests
//
//  Created by Thomas Romay on 09/09/2024.
//

@testable import LuckyDraws
import Testing

struct LotteryViewModelTests {
    @MainActor
    @Test func testLoadingAndSortingDrawsSuccess() async {
        let sut = makeSUT(mockDraws: [LotteryDrawStub.draw1, LotteryDrawStub.draw2])

        // Act
        await sut.loadLotteryDraws()

        // Assert
        #expect(sut.draws.count == 2, "Should load 2 draws")
        #expect(sut.draws.first?.id == "draw-1", "The most recent draw should come first.")
        #expect(sut.errorMessage == nil, "Error message should be nil on successful load")
    }

    @MainActor
    @Test func testLoadingDrawsFailure() async {
        let sut = makeSUT(mockDraws: [LotteryDrawStub.draw1, LotteryDrawStub.draw2], shouldFail: true)

        // Act
        await sut.loadLotteryDraws()

        // Assert
        #expect(sut.draws.count == 0, "No draws should be loaded on failure")
        #expect(sut.errorMessage != nil, "Error message should be set on failure")
        #expect(sut.errorMessage == "Failed to load data: Test Error", "Error message should match")
    }

    // MARK: - Test Text Processing Methods

    @MainActor
    @Test func testDrawDateFormatting() {
        // Arrange

        let sut = makeSUT()
        let draw = LotteryDrawStub.draw4

        // Act
        let formattedDate = sut.drawDate(for: draw)

        // Assert
        #expect(formattedDate == "Sun,Jun 25, 2023", "Date should be formatted as 'E,MMM dd, yyyy'")
    }

    @MainActor
    @Test func testSortedNumbers() {
        // Arrange
        let sut = makeSUT()

        let draw = LotteryDrawStub.draw3

        // Act
        let sortedNumbers = sut.sortedNumbers(for: draw)

        // Assert
        #expect(sortedNumbers == ["5", "24", "32", "45", "51"], "Numbers should be sorted in ascending order")
    }

    @MainActor
    @Test func testBonusBallsSorting() {
        // Arrange
        let sut = makeSUT(mockDraws: [LotteryDrawStub.draw1, LotteryDrawStub.draw2])

        let draw = LotteryDrawStub.draw4

        // Act
        let sortedBonusBalls = sut.bonusBalls(for: draw)

        // Assert
        #expect(sortedBonusBalls == ["2", "14", "45"], "Bonus balls should be sorted in ascending order")
    }

    @MainActor
    @Test func testTopPrizeFormatting() {
        // Arrange
        let sut = makeSUT(mockDraws: [LotteryDrawStub.draw1, LotteryDrawStub.draw2])

        let draw = LotteryDrawStub.draw3

        // Act
        let formattedPrize = sut.topPrize(for: draw)

        // Assert
        #expect(formattedPrize == "£6,000,000,000", "Top prize should be formatted with commas")
    }

    @MainActor
    @Test func testGameNameFormatting() {
        // Arrange
        let sut = makeSUT(mockDraws: [LotteryDrawStub.draw1, LotteryDrawStub.draw2])

        let draw = LotteryDrawStub.draw2
        // Act
        let gameName = sut.gameName(for: draw)

        // Assert
        #expect(gameName == "Game: Lotto", "Game name should be formatted correctly")
    }

    // MARK: - Private Functions

    @MainActor private func makeSUT(
        mockDraws: [LotteryDrawStub] = [], shouldFail: Bool = false
    ) -> LotteryViewModel {
        let mockService = MockServiceDataProvider(mockDraws: mockDraws, shouldFail: shouldFail)
        return LotteryViewModel(service: mockService)
    }
}
