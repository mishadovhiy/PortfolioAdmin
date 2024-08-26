//
//  PDFUnparceModel.swift
//  portfolioEditor
//
//  Created by Misha Dovhiy on 24.08.2024.
//

import Foundation
import UIKit
import SwiftUICore
import SwiftUI

extension PDFModel {
    class PDFUnparceModel {
        let input:PDFInput
        var results:PDFModel.PDFOutput {
            createResults
        }
        private var resultHeight:CGFloat = 0
        init(input: PDFInput) {
            self.input = input
        }
        
        var pageWidth:CGFloat = {
            PDFModel.pageWidth
        }()
        
        private var createResults:PDFOutput {
            let items = resultItems
            return .init(items: items, height: resultHeight)
        }
    }
}

fileprivate extension PDFModel.PDFUnparceModel {
    var resultItems: [PDFPreviewItem] {
        return [
            .init(contentString: body)
        ]
    }
    
    var body: NSAttributedString {
        if input.dictionary.isEmpty {
            return .init(string: "")
        }
        let page = UIHostingController(rootView: PDFPresenterView(pdfInput: input))
        page.view.frame = .init(origin: .zero, size:
                .init(width: input.pageWidth, height: 900))
        page.view.backgroundColor = .blue.withAlphaComponent(0.1)
        let attachment = NSTextAttachment(image: page.view.toImage)
        attachment.bounds = .init(origin: .zero, size: page.view.frame.size)
        return .init(attachment: attachment)
    }
    
}
