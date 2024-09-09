//
//  DrawDetailView.swift
//  LuckyDraws
//
//  Created by Thomas Romay on 09/09/2024.
//

import SwiftUI

struct DrawDetailView: View {
    let draw: LotteryDraw
    let viewModel: LotteryViewModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                gameInfoSection
                    .applyCardView()
                    .padding(.horizontal, 20)
                    .accessibilityElement(children: .combine)
                    .accessibilityLabel("Draw details for \(viewModel.gameName(for: draw)) on \(viewModel.drawDate(for: draw))")
                
                MyTicketsView(viewModel: MyTicketsViewModel(draw: draw))
                    .padding(.horizontal, 20)
                    .accessibilityLabel("Your tickets section")
                
                Spacer()
            }
            .padding(.top, 20)
        }
        .frame(maxWidth: .infinity)
        .background(backgroundColor.edgesIgnoringSafeArea(.bottom))
        .navigationTitle("Draw Details")
        .accessibilityLabel("Draw details screen")
    }
    
    // MARK: - Game Info Section

    private var gameInfoSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(viewModel.gameName(for: draw))
                .font(.headline)
                .accessibilityLabel("Game name: \(viewModel.gameName(for: draw))")
            
            HStack {
                Text(viewModel.drawDate(for: draw))
                    .font(.title).bold()
                    .accessibilityLabel("Draw date: \(viewModel.drawDate(for: draw))")
                Spacer()
                Text("Top Prize: \(viewModel.topPrize(for: draw))")
                    .accessibilityLabel("Top prize: \(viewModel.topPrize(for: draw))")
            }
            
            Image("drawImage")
                .resizable()
                .frame(height: 120)
                .cornerRadius(12)
                .clipped()
                .frame(maxWidth: .infinity)
                .accessibilityLabel("Lottery image")
            
            numberBallsSection
        }
    }
    
    // MARK: - Number Balls Section

    private var numberBallsSection: some View {
        HStack(spacing: 8) {
            Spacer()
            ForEach(viewModel.sortedNumbers(for: draw), id: \.self) { number in
                CircleView(text: number, color: .blue)
                    .accessibilityLabel("Number \(number)")
            }
            
            ForEach(viewModel.bonusBalls(for: draw), id: \.self) { bonus in
                CircleView(text: bonus, color: .red)
                    .accessibilityLabel("Bonus ball \(bonus)")
            }
            Spacer()
        }
    }
    
    // MARK: - Background Color

    private var backgroundColor: Color {
        Color.primaryColor
    }
}

// MARK: - Circle View for Numbers

struct CircleView: View {
    let text: String
    let color: Color
    
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(color)
                .frame(width: 34, height: 34)
            
            Text(text)
                .font(.body).bold()
                .foregroundColor(.white)
        }
    }
}

// MARK: - Card View Modifier

extension View {
    func applyCardView() -> some View {
        self
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.white)
                    .shadow(radius: 5)
            )
            .padding(.vertical, 8)
    }
}
