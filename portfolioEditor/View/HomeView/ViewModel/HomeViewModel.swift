//
//  ContentViewModel.swift
//  portfolioEditor
//
//  Created by Misha Dovhiy on 13.08.2024.
//

import Foundation

struct HomeViewModel {
    let pdfBackgroundAlphaComponent:CGFloat = 0.3
   // var pdfOutput:PDFInput = .init(pageWidth: 0, content: nil)
    var pdfContent:NSAttributedString = .init()
    var pdfModel = PDFModel()

    var exportPresenting:Bool {
        get {
            exportData != nil
        }
        set {
            if !newValue {
                exportData = nil
            }
        }
    }
    var exportData:Data?
    mutating func viewAppeared() {
        pdfContent = pdfModel.previewPDF().resultString
        guard let url = Bundle.main.url(forResource: "content", withExtension: "json") else {
            return
        }
        do {
            let data = try Data(contentsOf: url)
            if let content = PortfolioContent.configure(data) {
                self.pdfModel.content = content
             //   pdfOutput = .init(pageWidth: pdfModel.input.pageWidth, content: content)
                pdfContent = pdfModel.previewPDF().resultString
                print(content, " gterfde")
            }
        } catch {
            print(error, " rgrfed")
            return
        }
    }
    
    mutating func exportPdfPressed() {
        //exportPresenting = true
        if let data = pdfModel.exportPDF() {
            self.exportData = data
        }
    }
}
