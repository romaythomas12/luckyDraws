//
//  LotteryServiceDataProvidable.swift
//  LuckyDraws
//
//  Created by Thomas Romay on 09/09/2024.
//

import Foundation
protocol Drawable {
    associatedtype Model: LotteryDrawProtocol & Sendable
    func loadDraws() async throws -> [Model]
}

protocol Storeable {
    associatedtype Model
    func store(_ models: [Model]) async throws
}

protocol  LotteryServiceDataProvidable: Sendable    {
    associatedtype Model: LotteryDrawProtocol & Sendable
    func loadDraws() async throws -> [Model]
}
