//
//  LuckyDrawsApp.swift
//  LuckyDraws
//
//  Created by Thomas Romay on 09/09/2024.
//

import SwiftUI

@main
struct LuckyDrawsApp: App {
    var body: some Scene {
        WindowGroup {
            let viewModel = LotteryViewModel(service: LotteryServiceDataProvider())
            DrawsView(viewModel: viewModel)
        }
    }
}
