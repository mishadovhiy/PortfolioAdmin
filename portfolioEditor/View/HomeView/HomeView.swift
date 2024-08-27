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
            //AttributedStringView(pdfContent: viewModel.pdfContent)
            VStack {
                if let output = viewModel.testDictionary {
                    DictionaryListEditorView(dictionary: output)
                } else {
                    NoDataView()
                }
            }
            HStack {
                Button("export") {
                    viewModel.exportPdfPressed()
                }
                Button("upload") {
                    viewModel.uploadContent(completion: {
                        self.viewModel.uploadingContent = false
                    })
                }
                .disabled(viewModel.uploadingContent)
            }
        }
        .padding()
        .onAppear {
            DispatchQueue.main.async {
                self.viewModel.viewAppeared()
            }
        }
        .fullScreenCover(isPresented: $viewModel.exportPresenting) {
            ActivityView(activityItems: [viewModel.exportData ?? .init()])
        }
    }
}

#Preview {
    HomeView()
}
