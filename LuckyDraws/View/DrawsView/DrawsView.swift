//
//  DrawsView.swift
//  LuckyDraws
//
//  Created by Thomas Romay on 09/09/2024.
//

import SwiftUI

struct DrawsView: View {
    @StateObject var viewModel: LotteryViewModel

    var body: some View {
        NavigationView {
            content
                .navigationTitle("Lottery Draws")
                .navigationBarTitleDisplayMode(.large)
                .background(backgroundColor.edgesIgnoringSafeArea(.bottom))
                .accessibilityElement(children: .contain)
                .accessibilityLabel("Lottery draws list view")
                .accessibilityAddTraits(.isHeader)
        }
        .task {
            await viewModel.loadLotteryDraws()
        }
    }

    // MARK: - Content View

    @ViewBuilder
    private var content: some View {
        switch viewModel.state {
        case .initial:
            SpinnerView()
                .accessibilityLabel("Loading draws")
        case .loaded:
            listView
        case .failed:
            if let errorMessage = viewModel.errorMessage {
                errorView(errorMessage)
            }
        }
    }

    // MARK: - List View with Cards and Spacing

    private var listView: some View {
        List {
            ForEach(viewModel.draws) { draw in
                Section {
                    NavigationLink(destination: DrawDetailView(draw: draw, viewModel: viewModel)) {
                        DrawRowView(draw: draw, viewModel: viewModel)
                            .cardStyle()
                            .accessibilityElement(children: .combine)
                            .accessibilityLabel(draw.gameName)
                            .accessibilityHint("Tap to view details for draw on \(draw.drawDate)")
                    }
                }
                .listRowSeparator(.hidden)
                .listRowBackground(Color.clear)
                .listRowInsets(EdgeInsets())
                .padding(.top, 16)
            }
        }
        .scrollContentBackground(.hidden)
        .accessibilityLabel("List of lottery draws")
    }

    // MARK: - Error View

    private func errorView(_ message: String) -> some View {
        Text("Error: \(message)")
            .foregroundColor(.red)
            .padding()
            .accessibilityLabel("Error: \(message)")
            .accessibilityHint("An error occurred while loading lottery draws")
    }

    // MARK: - Background Color

    private var backgroundColor: Color {
        Color.primaryColor
    }
}

#Preview {
    DrawsView(viewModel: LotteryViewModel(service: LotteryServiceDataProvider()))
}
