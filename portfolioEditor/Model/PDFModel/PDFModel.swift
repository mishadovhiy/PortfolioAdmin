//
//  PDFModel.swift
//  portfolioEditor
//
//  Created by Misha Dovhiy on 24.08.2024.
//

import Foundation

struct PDFModel {
    static let pageWidth:CGFloat = 680
    var content:PortfolioContent = .init(skills: []) {
        didSet {
            self.input = .init(pageWidth: PDFModel.pageWidth, content: content)
        }
    }
    var input:PDFInput = .init(pageWidth: PDFModel.pageWidth, content: .init(skills: []))

    func previewPDF() -> PDFOutput {
        let unparce = PDFUnparceModel(input: input)
        return unparce.results
    }
}

extension PDFModel {
    struct PDFOutput {
        let items:[PDFPreviewItem]
        let height:CGFloat
        
        var resultString:NSAttributedString {
            print(#file, #line, " gchvjb", items)
            let text: NSMutableAttributedString = .init()
            items.forEach {
                text.append($0.contentString)
            }
            return text
        }
    }
}


