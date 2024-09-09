//
//  LotteryDataProtocol.swift
//  LuckyDraws
//
//  Created by Thomas Romay on 09/09/2024.
//

import Foundation
protocol LotteryDataProtocol {
    var draws: [LotteryDraw] { get }
}

protocol LotteryDrawProtocol: Sendable {
    var gameID: Int { get }
    var gameName: String { get }
    var id: String { get }
    var drawDate: String { get }
    var number1: String { get }
    var number2: String { get }
    var number3: String { get }
    var number4: String { get }
    var number5: String { get }
    var number6: String? { get }
    var bonusBalls: [String] { get }
    var topPrize: Int { get }
}

extension LotteryDrawProtocol {
    var lotteryType: LotteryType? {
        LotteryType(rawValue: gameName)
    }
}
