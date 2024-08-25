//
//  ContentView.swift
//  portfolioEditor
//
//  Created by Misha Dovhiy on 06.08.2024.
//

import SwiftUI

struct HomeView: View {
    @State var viewModel:HomeViewModel = .init()
    @State var image:UIImage? = nil
    var body: some View {
        VStack {
            AttributedStringView(pdfContent: viewModel.pdfContent)
          //  Image(uiImage: image ?? .init())
        }
        .padding()
        .onAppear {
            let test = viewModel.pdfModel.previewPDF()
            print(test.items)
            DispatchQueue.main.async {
                let view = UIHostingController(rootView: PDFGeneratorView(pdfInput: .init(pageWidth: 500, skills: [
                    .init(key: "sdds", skills: ["sdsd", "grwed"])
                ]))).view
                view?.frame = .init(origin: .zero, size: .init(width: 600, height: 800))
                self.image = view?.toImage
                self.viewModel.viewAppeared()
            }
        }
    }
}

#Preview {
    HomeView()
}
