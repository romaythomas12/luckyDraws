//
//  LotteryTicketProtocol.swift
//  LuckyDraws
//
//  Created by Thomas Romay on 09/09/2024.
//

import Foundation

protocol LotteryTicketProtocol {
    var numbers: [Int] { get }
    var bonusBalls: [Int] { get }
}
