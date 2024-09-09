//
//  MockLotteryService.swift
//  LuckyDraws
//
//  Created by Thomas Romay on 09/09/2024.
//

import Foundation

struct MockLotteryService: Drawable {
    typealias Model = LotteryDraw
    
    func loadDraws() async throws -> [Model] {
        guard let path = Bundle.main.path(forResource: "LotteryData", ofType: "json") else {
            throw LotteryServiceError.fileNotFound
        }
        
        let url = URL(fileURLWithPath: path)
        let data = try Data(contentsOf: url)
        
        let decoder = JSONDecoder()
        let lotteryData = try decoder.decode(LotteryData.self, from: data)
        
        return lotteryData.draws
    }
}
