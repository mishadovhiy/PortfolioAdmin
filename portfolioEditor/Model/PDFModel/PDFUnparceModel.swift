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
        
        private var pageWidth:CGFloat = {
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
    
    var sectionTitleFont:UIFont {
        .systemFont(ofSize: 24, weight: .semibold)
    }
    
    var body: NSAttributedString {
        if input.dictionary.isEmpty {
            return .init(string: "")
        }
//        var string = NSMutableAttributedString()
//        string.append(.init(string: "Skils"))
//        string.append(.init(string: "\n"))
//        resultHeight += sectionTitleFont.calculate(inWindth: pageWidth, string: string.string).height
//        input.dictionary.forEach {
//            $0.forEach { (key: String, value: Any) in
//                let valueString = (value as? [String] ?? []).joined(separator: ", ")
//                string.append(.init(string: key + ":"))
//                string.append(.init(string: valueString))
//                resultHeight +=
//                string.append(.init(string: "\n"))
//            }
//        }
//        if string.length <= .zero {
//            string.append(.init(string: "\n"))
//        }
    //   return string
        let page = UIHostingController(rootView: PDFGeneratorView(pdfInput: input))
        page.view.frame = .init(origin: .zero, size: .init(width: 600, height: 800))
        print("fsd ", page.view.frame.size)
        let attachment = NSTextAttachment(image: page.view.toImage)
        attachment.bounds = .init(origin: .zero, size: .init(width: 600, height: 100))
        return .init(attachment: attachment)
    }
    
}
