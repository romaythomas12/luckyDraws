//
//  LotteryViewModel.swift
//  LuckyDraws
//
//  Created by Thomas Romay on 09/09/2024.
//

import Foundation
import SwiftUI

@MainActor
final class LotteryViewModel: ObservableObject {
    enum State {
        case initial
        case loaded
        case failed
    }

    @Published var draws: [LotteryDraw] = []
    @Published var errorMessage: String?
    @Published var state: State = .initial

    private let service: any LotteryServiceDataProvidable

    init(service: any LotteryServiceDataProvidable) {
        self.service = service
    }

    func loadLotteryDraws() async {
        do {
            let data = try await Task.detached {
                return try await self.service.loadDraws()
            }.value

            self.draws = LotteryDrawSorter.sort(draws: data)
            self.state = .loaded
        } catch {
            self.state = .failed
            self.errorMessage = "Failed to load data: \(error.localizedDescription)"
        }
    }

    // MARK: - Text Processing

    nonisolated func drawDate(for draw: LotteryDrawProtocol) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"

        guard let date = dateFormatter.date(from: draw.drawDate) else { return String() }
        dateFormatter.dateFormat = "E,MMM dd, yyyy"
        return dateFormatter.string(from: date)
    }

    nonisolated func sortedNumbers(for draw: LotteryDrawProtocol) -> [String] {
        LotteryDrawSorter.sortNumbers(in: draw)
    }

    nonisolated func bonusBalls(for draw: LotteryDrawProtocol) -> [String] {
        LotteryDrawSorter.sortBonus(in: draw)
    }

    nonisolated func topPrize(for draw: LotteryDrawProtocol) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        if let formatted = formatter.string(from: NSNumber(value: draw.topPrize)) {
            return "£\(formatted)"
        }
        return "£\(draw.topPrize)"
    }

    nonisolated func gameName(for draw: LotteryDrawProtocol) -> String {
        "Game: \(draw.gameName)"
    }
}
