//
//  PDFInput.swift
//  portfolioEditor
//
//  Created by Misha Dovhiy on 24.08.2024.
//

import Foundation

struct PDFInput {

    let skills:[SkillListItem]
    
    var dictionary:[[String : Any]] {
        do {
            return try skills.compactMap {
                try $0.dictionary()
            }
        } catch {
            print(error, #file, #line)
            return []
        }
    }
}
