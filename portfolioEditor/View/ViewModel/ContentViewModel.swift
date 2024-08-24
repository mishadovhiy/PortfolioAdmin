//
//  ContentViewModel.swift
//  portfolioEditor
//
//  Created by Misha Dovhiy on 13.08.2024.
//

import Foundation

struct ContentViewModel {
    let pdfBackgroundAlphaComponent:CGFloat = 0.3
    var pdfContent:String {
        pdfModel.previewPDF().resultString
    }
    let pdfModel = PDFModel()
}
