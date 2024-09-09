//
//  LotteryTicket.swift
//  LuckyDraws
//
//  Created by Thomas Romay on 09/09/2024.
//

import Foundation

struct LotteryTicket: LotteryTicketProtocol, Equatable {
    let numbers: [Int]
    let bonusBalls: [Int]
}
