//
//  LotteryDrawLocalAPI.swift
//  LuckyDraws
//
//  Created by Thomas Romay on 09/09/2024.
//

import Foundation
struct LotteryDrawLocalAPI: Drawable {
    typealias Model = LotteryDraw
    private let cacheKey = "cachedLotteryData"

    
    func loadDraws() async throws -> [Model] {
        guard let cachedData = UserDefaults.standard.data(forKey: cacheKey) else {
            throw LotteryServiceError.fileNotFound
        }

        let decoder = JSONDecoder()
        return try decoder.decode([Model].self, from: cachedData)
    }
}

extension LotteryDrawLocalAPI: Storeable {
    /// Store lottery draws in the cache.
    func store(_ models: [Model]) async throws {
        let encoder = JSONEncoder()
        let data = try encoder.encode(models)
        UserDefaults.standard.set(data, forKey: cacheKey)
    }
}
