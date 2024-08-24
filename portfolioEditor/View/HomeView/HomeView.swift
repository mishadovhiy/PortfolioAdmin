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
            PDFPreviewView(pdfContent: viewModel.pdfContent)
        }
        .padding()
        .onAppear {
            let test = viewModel.pdfModel.previewPDF()
            print(test.items)
            
        }
    }
}

#Preview {
    HomeView()
}
