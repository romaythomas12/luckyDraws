//
//  SpinnerView.swift
//  LuckyDraws
//
//  Created by Thomas Romay on 09/09/2024.
//
import SwiftUI

struct SpinnerView: View {
  var body: some View {
    ProgressView()
      .progressViewStyle(CircularProgressViewStyle(tint: .blue))
      .scaleEffect(2.0, anchor: .center)
      .onAppear {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
          // TODO
        }
      }
  }
}
