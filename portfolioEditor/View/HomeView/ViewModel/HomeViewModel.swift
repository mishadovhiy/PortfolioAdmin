//
//  ContentViewModel.swift
//  portfolioEditor
//
//  Created by Misha Dovhiy on 13.08.2024.
//

import Foundation

struct HomeViewModel {
    let pdfBackgroundAlphaComponent:CGFloat = 0.3
    var pdfContent:NSAttributedString = .init()
    let pdfModel = PDFModel()
    
    mutating func viewAppeared() {
        pdfContent = pdfModel.previewPDF().resultString
        guard let url = Bundle.main.url(forResource: "content", withExtension: "json") else {
            return
        }
        do {
            let data = try Data(contentsOf: url)
            print(data.count, " tgerfwed")
            let datad = PortfolioContent.configure(data)
            print(datad, " gterfde")
        } catch {
            print(error, " rgrfed")
            return
        }
    }
}
