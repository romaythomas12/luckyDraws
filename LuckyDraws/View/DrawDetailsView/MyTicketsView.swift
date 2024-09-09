//
//  MyTicketsView.swift
//  LuckyDraws
//
//  Created by Thomas Romay on 09/09/2024.
//

import SwiftUI

struct MyTicketsView: View {
    @StateObject private var viewModel: MyTicketsViewModel

    init(viewModel: MyTicketsViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        VStack {
            if let ticket = viewModel.generatedTicket {
                ticketSection(for: ticket)
                    .accessibilityLabel("Your generated lottery ticket")
            } else {
                Text("No Ticket Generated")
                    .font(.headline)
                    .foregroundColor(.gray)
                    .accessibilityLabel("No ticket has been generated")
            }

            generateTicketButton
                .accessibilityLabel("Generate a random lottery ticket")
            //generateTicketButton is used for easy testing, it can be removed
        }
        .onAppear {
            viewModel.generateTicket()
        }
    }

    // MARK: - Ticket Section

    @ViewBuilder
    private func ticketSection(for ticket: LotteryTicket) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Your Ticket")
                .font(.title2.weight(.semibold))
                .accessibilityLabel("Your ticket numbers")

            HStack(spacing: 8) {
                ForEach(ticket.numbers, id: \.self) { number in
                    CircleView(text: "\(number)", color: viewModel.matchedNumbers.contains(number) ? .yellow : .blue)
                        .accessibilityLabel("Number \(number), \(viewModel.matchedNumbers.contains(number) ? "matched" : "not matched")")
                }

                ForEach(ticket.bonusBalls, id: \.self) { bonusBall in
                    CircleView(text: "\(bonusBall)", color: viewModel.matchedBonusBalls.contains(bonusBall) ? .yellow : .red)
                        .accessibilityLabel("Bonus ball \(bonusBall), \(viewModel.matchedBonusBalls.contains(bonusBall) ? "matched" : "not matched")")
                }

                Spacer()
            }
            .frame(maxWidth: .infinity)

            Text("Matched Numbers: \(viewModel.matchedNumbers.count)")
                .font(.body.weight(.semibold))
                .accessibilityLabel("You matched \(viewModel.matchedNumbers.count) numbers")

            Text("Matched Bonus Balls: \(viewModel.matchedBonusBalls.count)")
                .font(.body.weight(.semibold))
                .accessibilityLabel("You matched \(viewModel.matchedBonusBalls.count) bonus balls")
        }
        .applyCardView()
    }

    // MARK: - Generate Ticket Button

    private var generateTicketButton: some View {
        Button(action: {
            viewModel.generateTicket()
        }) {
            Text("Generate Random Ticket")
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .cornerRadius(10)
        }
    }
}

extension MyTicketsView {
    struct CircleView: View {
        let text: String
        let color: Color

        var body: some View {
            ZStack {
                Circle()
                    .stroke(color, lineWidth: 1)
                    .background(Circle().foregroundColor(.white))
                    .frame(width: 40, height: 40)

                Text(text)
                    .font(.body.bold())
                    .foregroundColor(color == .yellow ? .yellow : .black)
            }
        }
    }
}
