//
//  ContentView.swift
//  portfolioEditor
//
//  Created by Misha Dovhiy on 06.08.2024.
//

import SwiftUI

struct ContentView: View {
    @State var viewModel:ContentViewModel = .init()
    
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
    ContentView()
}
