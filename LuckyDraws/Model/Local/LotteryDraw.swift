//
//  LotteryDraw.swift
//  LuckyDraws
//
//  Created by Thomas Romay on 09/09/2024.
//
import Foundation
struct LotteryData: LotteryDataProtocol, Codable {
    let draws: [LotteryDraw]
}

struct LotteryDraw: Identifiable, Codable, Sendable {
    let gameID: Int
    let gameName, id, drawDate, number1: String
    let number2, number3, number4, number5: String
    let number6: String?
    let bonusBalls: [String]
    let topPrize: Int

    enum CodingKeys: String, CodingKey {
        case gameID = "gameId"
        case gameName, id, drawDate, number1, number2, number3, number4, number5, number6
        case bonusBalls = "bonus-balls"
        case topPrize
    }
}

extension LotteryDraw: LotteryDrawProtocol {
    init(from protocolObject: LotteryDrawProtocol) {
        self.gameID = protocolObject.gameID
        self.gameName = protocolObject.gameName
        self.id = protocolObject.id
        self.drawDate = protocolObject.drawDate
        self.number1 = protocolObject.number1
        self.number2 = protocolObject.number2
        self.number3 = protocolObject.number3
        self.number4 = protocolObject.number4
        self.number5 = protocolObject.number5
        self.number6 = protocolObject.number6
        self.bonusBalls = protocolObject.bonusBalls
        self.topPrize = protocolObject.topPrize
    }
}
