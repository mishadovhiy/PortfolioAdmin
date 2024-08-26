//
//  PDFInput.swift
//  portfolioEditor
//
//  Created by Misha Dovhiy on 24.08.2024.
//

import Foundation

struct PDFInput {
    let pageWidth:CGFloat
    let content:PortfolioContent?
    
    var dictionary:[[String : Any]] {
        do {
            return try (content?.skills ?? []).compactMap {
                try $0.dictionary()
            }
        } catch {
            print(error, #file, #line)
            return []
        }
    }
}
