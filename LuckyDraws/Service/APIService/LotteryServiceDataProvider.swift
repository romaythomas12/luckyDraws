//
//  LotteryServiceDataProvider.swift
//  LuckyDraws
//
//  Created by Thomas Romay on 09/09/2024.
//
import Foundation
struct LotteryServiceDataProvider<RemoteAPI: Drawable & Sendable,
    LocalAPI: Drawable & Storeable & Sendable, MockAPI: Drawable & Sendable>: LotteryServiceDataProvidable
    where RemoteAPI.Model == LocalAPI.Model, RemoteAPI.Model == MockAPI.Model {
    typealias Model = RemoteAPI.Model

    private let remoteService: RemoteAPI
    private let localService: LocalAPI
    private let mockService: MockAPI

    init(remoteService: RemoteAPI = LotteryDrawRemoteAPI(),
         localService: LocalAPI = LotteryDrawLocalAPI(),
         mockService: MockAPI = MockLotteryService()) {
        self.remoteService = remoteService
        self.localService = localService
        self.mockService = mockService
    }

    /// Load lottery draws, using remote API first, and falling back to local cache if needed.
    func loadDraws() async throws -> [Model] {
        do {
            if FeatureFlags.isLotteryDrawMockEnabled {
                #warning("Mock draw data is used. Remove once the remote API is wired")
                return try await mockService.loadDraws()
            }

            let draws = try await remoteService.loadDraws()

            try await localService.store(draws)

            return draws
        } catch {
            print("Remote service failed: \(error.localizedDescription). Falling back to local service.")

            // Fallback to local service
            return try await localService.loadDraws()
        }
    }
}
