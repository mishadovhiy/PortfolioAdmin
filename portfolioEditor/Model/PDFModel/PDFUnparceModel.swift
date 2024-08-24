//
//  PDFUnparceModel.swift
//  portfolioEditor
//
//  Created by Misha Dovhiy on 24.08.2024.
//

import Foundation

extension PDFModel {
    struct PDFUnparceModel {
        let input:PDFInput
        var results:PDFModel.PDFOutput {
            createResults
        }
        
        init(input: PDFInput) {
            self.input = input
        }
        
        private var createResults: PDFOutput {
            return .init(items: resultItems, height: 0)
        }
    }
}

fileprivate extension PDFModel.PDFUnparceModel {
    var resultItems:[PDFPreviewItem] {
        return [
            .init(contentString: body)
        ]
    }
    
    var body:NSAttributedString {
        var string:String = ""
        string.append("title")
        string.append("\n")
        input.dictionary.forEach {
            $0.forEach { (key: String, value: Any) in
                string.append("\(key):\((value as? [String] ?? []).joined(separator: ", "))")
                string.append("\n")
            }
        }
        if string.isEmpty {
            string.append("-")
        }
        return .init(string: string)
    }
}
