//
//  LotteryDrawSorter.swift
//  LuckyDraws
//
//  Created by Thomas Romay on 09/09/2024.
//

import Foundation
protocol LotterySorterProtocol {
    static func sort(draws: [LotteryDrawProtocol]) -> [LotteryDraw]
}

struct LotteryDrawSorter: LotterySorterProtocol {
    static func sort(draws: [LotteryDrawProtocol]) -> [LotteryDraw] {
         let groupedDraws = Dictionary(grouping: draws.compactMap { LotteryDraw(from: $0) }) { draw -> LotteryType in
             draw.lotteryType ?? .lotto
         }

         return groupedDraws
             .sorted { $0.key.rawValue < $1.key.rawValue }
             .flatMap { $0.value.sorted { $0.drawDate < $1.drawDate } }      }

    static func sortNumbers(in draw: LotteryDrawProtocol) -> [String] {
        return sortStrings([draw.number1, draw.number2, draw.number3, draw.number4, draw.number5, draw.number6])
    }

    static func sortBonus(in draw: LotteryDrawProtocol) -> [String] {
        return sortStrings(draw.bonusBalls)
    }

    private static func sortStrings(_ strings: [String?]) -> [String] {
        return strings
            .compactMap { $0 }
            .compactMap { Int($0) }
            .sorted(by: <)
            .map { String($0) }
    }
}
