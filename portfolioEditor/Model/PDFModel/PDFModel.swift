//
//  PDFModel.swift
//  portfolioEditor
//
//  Created by Misha Dovhiy on 24.08.2024.
//

import Foundation
import PDFKit

struct PDFModel {
    static let pageWidth:CGFloat = 300
    var content:PortfolioContent? = .configure(nil) {
        didSet {
            self.input = .init(pageWidth: PDFModel.pageWidth, content: content)
        }
    }
    var input:PDFInput = .init(pageWidth: PDFModel.pageWidth, content:.configure(nil))
    
    func previewPDF() -> PDFOutput {
        let unparce = PDFUnparceModel(input: input)
        return unparce.results
    }
    lazy var generator:PDFPageGeneration = .init()
    
    mutating func exportPDF() -> Data? {
        if let pdf = self.createPDF(),
           let pdfData = pdf.dataRepresentation(){
            return pdfData
        } else {
            showError("error generating pdf")
            return nil
        }
    }
    
    private mutating func createPDF() -> PDFDocument? {
        let pdfDocument = PDFDocument()
        let text = previewPDF()
        
        guard let page = generator.createPDFPage(fromAttributes: .init(attributedString: text.resultString), textHeight: text.height, pageWidth: PDFModel.pageWidth, background: UIColor.white.cgColor)
        else {
            showError("Error converting to pdf image")
            return nil
        }
        pdfDocument.insert(page, at: pdfDocument.pageCount)
        return pdfDocument
    }
    
    func showError(_ title:String) {
        print(title, " errorpdf")
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


