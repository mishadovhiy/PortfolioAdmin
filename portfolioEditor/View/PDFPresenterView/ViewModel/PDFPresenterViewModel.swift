//
//  PDFGeneratorViewModel.swift
//  portfolioEditor
//
//  Created by Misha Dovhiy on 26.08.2024.
//

import Foundation
import SwiftUICore

extension PDFPresenterView {
    struct PDFPresenterViewModel {
        private let pdfInput:PDFInput
        init(pdfInput: PDFInput) {
            self.pdfInput = pdfInput
        }
        var biggerPageWidth:CGFloat {
            pdfInput.pageWidth * 0.5
        }
        let containerColor:Color = .red
        
        let regularFont:Font = .system(size: 9)
        let articleFont:Font = .system(size: 10)
        let sectionTitleFont:Font = .system(size: 12)
        let extraSmallFont:Font = .system(size: 7)
        
        var content:PortfolioContent? {
            return pdfInput.content
        }
    }
}
