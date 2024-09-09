//
//  View+Extension.swift
//  LuckyDraws
//
//  Created by Thomas Romay on 09/09/2024.
//

import SwiftUI

extension View {
    func cardStyle() -> some View {
        self
            .padding()
            .background(RoundedRectangle(cornerRadius: 10).fill(Color.white).shadow(radius: 5))
            .padding([.top, .horizontal], 10)
            .accessibilityElement(children: .combine)
    }
}
