//
//  DrawRowView.swift
//  LuckyDraws
//
//  Created by Thomas Romay on 09/09/2024.
//

import SwiftUI

struct DrawRowView: View {
    let draw: LotteryDrawProtocol
    let viewModel: LotteryViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            headerView
            lotteryImageView
            numbersView
        }
        .frame(maxWidth: .infinity)
        .padding(.bottom, 12)
        .accessibilityElement(children: .combine) // Group everything into one accessible element
        .accessibilityLabel("\(draw.gameName) draw on \(viewModel.drawDate(for: draw))")
        .accessibilityHint("Shows numbers and bonus balls for the draw")
    }
    
    // MARK: - Header View

    private var headerView: some View {
        HStack(spacing: 8) {
            Text(draw.gameName)
                .font(.headline).bold()
                .accessibilityLabel(draw.gameName)
            
            Spacer()
            
            Text(viewModel.drawDate(for: draw))
                .font(.body.weight(.semibold))
                .accessibilityLabel("Draw date: \(viewModel.drawDate(for: draw))")
            
            Image(systemName: "calendar.circle.fill")
                .resizable()
                .frame(width: 40, height: 40)
                .accessibilityHidden(true) // Decorative, no need for accessibility
        }
        .frame(maxWidth: .infinity)
    }
    
    // MARK: - Lottery Image View

    private var lotteryImageView: some View {
        Image(draw.lotteryType == .lotto ? "lotto" : "lottoPlus")
            .resizable()
            .cornerRadius(12)
            .frame(height: 80)
            .frame(maxWidth: .infinity)
            .accessibilityLabel("Lottery image for \(draw.lotteryType == .lotto ? "Lotto images" : "Lotto plus image")")
    }
    
    // MARK: - Numbers and Bonus Balls View

    private var numbersView: some View {
        HStack(spacing: 8) {
            ForEach(viewModel.sortedNumbers(for: draw), id: \.self) { number in
                circleView(text: number, color: .blue)
                    .accessibilityLabel("Number \(number)")
            }
            ForEach(viewModel.bonusBalls(for: draw), id: \.self) { bonus in
                circleView(text: bonus, color: .yellow)
                    .accessibilityLabel("Bonus ball \(bonus)")
            }
   
        }
    }
    
    // MARK: - Circle View for Numbers and Bonus Balls

    private func circleView(text: String, color: Color) -> some View {
        ZStack {
            Circle()
                .foregroundColor(color)
                .frame(width: 34, height: 34)
            
            Text(text)
                .font(.body.weight(.bold))
                .foregroundColor(.white)
        }
    }
}
