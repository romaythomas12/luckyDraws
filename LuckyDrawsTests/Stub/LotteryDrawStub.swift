//
//  LotteryDrawStub.swift
//  LuckyDrawsTests
//
//  Created by Thomas Romay on 09/09/2024.
//

import Foundation
@testable import LuckyDraws

struct LotteryDrawStub: LotteryDrawProtocol, Sendable, Equatable {
    let gameID: Int
    let gameName: String
    let id: String
    let drawDate: String
    let number1: String
    let number2: String
    let number3: String
    let number4: String
    let number5: String
    let number6: String?
    let bonusBalls: [String]
    let topPrize: Int

    static var draw1: LotteryDrawStub {
        .init(gameID: 1, gameName: "Lotto", id: "draw-1", drawDate: "2023-05-15", number1: "5", number2: "1", number3: "3", number4: "6", number5: "2", number6: "4", bonusBalls: ["7"], topPrize: 1000000)
    }

    static var draw2: LotteryDrawStub {
        .init(gameID: 1, gameName: "Lotto", id: "draw-2", drawDate: "2023-05-22", number1: "10", number2: "12", number3: "14", number4: "16", number5: "18", number6: "20", bonusBalls: ["22"], topPrize: 2000000)
    }

    static var draw3: LotteryDrawStub {
        .init(gameID: 1, gameName: "Lotto", id: "draw-1", drawDate: "2023-06-25", number1: "5", number2: "45", number3: "51", number4: "32", number5: "24", number6: nil, bonusBalls: ["14"], topPrize: 6000000000)
    }

    static var draw4: LotteryDrawStub {
        .init(gameID: 1, gameName: "LottoPlus", id: "draw-4", drawDate: "2023-06-25", number1: "5", number2: "45", number3: "51", number4: "32", number5: "24", number6: nil, bonusBalls: ["14", "2", "45"], topPrize: 6000000000)
    }

    static var draw5: LotteryDrawStub {
        .init(gameID: 1, gameName: "Lotto", id: "draw-5", drawDate: "2023-06-25", number1: "5", number2: "2", number3: "3", number4: "1", number5: "4", number6: "6", bonusBalls: ["6"], topPrize: 800000000)
    }

    static var draw6: LotteryDrawStub {
        .init(gameID: 1,
              gameName: "Lotto",
              id: "draw-6",
              drawDate: "2023-05-15",
              number1: "2",
              number2: "16",
              number3: "23",
              number4: "44",
              number5: "47",
              number6: "52",
              bonusBalls: ["14"],
              topPrize: 4000000000)
    }
}
