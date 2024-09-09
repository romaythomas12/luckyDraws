//
//  MockServiceDataProvider.swift
//  LuckyDrawsTests
//
//  Created by Thomas Romay on 09/09/2024.
//

import Foundation
@testable import LuckyDraws

@MainActor
final class MockServiceDataProvider: LotteryServiceDataProvidable, @unchecked Sendable {
    typealias Model = LotteryDrawStub
    let mockDraws: [LotteryDrawStub]
    let shouldFail: Bool
    init(mockDraws: [LotteryDrawStub] = [], shouldFail: Bool = false) {
        self.mockDraws = mockDraws
        self.shouldFail = shouldFail
    }

    func loadDraws() async throws -> [Model] {
        if shouldFail {
            throw NSError(domain: "TestError", code: -1, userInfo: [NSLocalizedDescriptionKey: "Test Error"])
        }

        return mockDraws
    }
}
