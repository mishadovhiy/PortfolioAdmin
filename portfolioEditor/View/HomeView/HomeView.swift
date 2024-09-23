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
                if let _ = viewModel.testDictionary {
                    ScrollView(.vertical) {
                        NavigationView {
                            DictionaryListEditorView(dictionary: .init(get: {
                                viewModel.testDictionary ?? [:]
                            }, set: {
                                print("superviewdictChanged")
                                viewModel.testDictionary = $0
                            }))
                        }
                    }
                } else {
                    NoDataView()
                }
            }
            HStack {
                Spacer()
                Button("export") {
                    viewModel.exportPdfPressed()
                }
                Spacer()
                Button("upload") {
                    viewModel.uploadContent(completion: {
                        self.viewModel.uploadingContent = false
                    })
                }
                .disabled(viewModel.uploadingContent)
                Spacer()
            }
        }
        .padding()
        .onAppear {
            viewModel.viewAppeared()
        }
        .fullScreenCover(isPresented: $viewModel.exportPresenting) {
            ActivityView(activityItems: [viewModel.exportData ?? .init()])
        }
    }
}

#Preview {
    HomeView()
}
