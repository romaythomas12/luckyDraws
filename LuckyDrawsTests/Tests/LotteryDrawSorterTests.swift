//
//  LotteryDrawSorterTests.swift
//  LuckyDrawsTests
//
//  Created by Thomas Romay on 09/09/2024.
//

@testable import LuckyDraws
import Testing

struct LotteryDrawSorterTests {
    @Test func testSortingLotteryDrawsByDate() {
        let draws = [LotteryDrawStub.draw3, LotteryDrawStub.draw4, LotteryDrawStub.draw1, LotteryDrawStub.draw5]
        let sortedDraws = LotteryDrawSorter.sort(draws: draws)

        #expect(sortedDraws.first?.id == "draw-1", "The most recent draw should come first.")
    }

    @Test func testSortingNumbersInDraw() {
        let draw = LotteryDrawStub.draw5

        let sortedNumbers = LotteryDrawSorter.sortNumbers(in: draw)

        #expect(sortedNumbers == ["1", "2", "3", "4", "5", "6"], "The numbers should be sorted in ascending order.")
    }
}
