//
//  PDFInput.swift
//  portfolioEditor
//
//  Created by Misha Dovhiy on 24.08.2024.
//

import Foundation
//codable - to convert to dict when unparcing
struct PDFInput {
    //indeed dict
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
