//
//  LotteryDrawRemoteAPI.swift
//  LuckyDraws
//
//  Created by Thomas Romay on 09/09/2024.
//

import Foundation
struct LotteryDrawRemoteAPI: Drawable, Sendable {
    typealias Model = LotteryDraw

    func loadDraws() async throws -> [Model] {
        // Remote api not wired
        return []
    }
}
