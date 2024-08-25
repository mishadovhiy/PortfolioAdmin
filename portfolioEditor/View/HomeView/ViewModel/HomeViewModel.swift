//
//  ContentViewModel.swift
//  portfolioEditor
//
//  Created by Misha Dovhiy on 13.08.2024.
//

import Foundation

struct HomeViewModel {
    let pdfBackgroundAlphaComponent:CGFloat = 0.3
    var pdfContent:NSAttributedString
    let pdfModel = PDFModel()
    init() {
        print("HomeViewModelHomeViewModel")
        self.pdfContent = pdfModel.previewPDF().resultString
    }
}
