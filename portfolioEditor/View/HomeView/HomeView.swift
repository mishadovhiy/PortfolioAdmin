//
//  ContentView.swift
//  portfolioEditor
//
//  Created by Misha Dovhiy on 06.08.2024.
//

import SwiftUI

struct HomeView: View {
    @State var viewModel:HomeViewModel = .init()

    var body: some View {
        VStack {
            AttributedStringView(pdfContent: viewModel.pdfContent)
        }
        .padding()
        .onAppear {
            DispatchQueue.main.async {
                self.viewModel.viewAppeared()
            }
        }
    }
}

#Preview {
    HomeView()
}
