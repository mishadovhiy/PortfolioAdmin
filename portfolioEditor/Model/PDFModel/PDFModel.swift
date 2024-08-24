//
//  PDFModel.swift
//  portfolioEditor
//
//  Created by Misha Dovhiy on 24.08.2024.
//

import Foundation

struct PDFModel {
    func previewPDF() -> PDFOutput {
        let unparce = PDFUnparceModel(input: .init(skills: [
            .init(key: "uikit", skills: ["uikit", "swiftui"])
        ]))
        return unparce.results
    }
}

extension PDFModel {
    struct PDFOutput {
        let items:[PDFPreviewItem]
        let height:CGFloat
        
        var resultString:String {
            return items.compactMap({
                $0.contentString.string
            }).joined(separator: ";\n")
        }
    }
}


