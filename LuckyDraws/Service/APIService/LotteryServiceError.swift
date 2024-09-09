//
//  LotteryServiceError.swift
//  LuckyDraws
//
//  Created by Thomas Romay on 09/09/2024.
//

import Foundation
enum LotteryServiceError: Error, LocalizedError {
    case fileNotFound
    case dataCorrupted
    case remoteServiceError

    var errorDescription: String? {
        switch self {
        case .fileNotFound:
            return "Lottery data file not found."
        case .dataCorrupted:
            return "Lottery data is corrupted."
        case .remoteServiceError:
            return "Failed to fetch data from remote service."
        }
    }
}
