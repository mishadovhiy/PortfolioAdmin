//
//  SkillListItem.swift
//  portfolioEditor
//
//  Created by Misha Dovhiy on 24.08.2024.
//

import Foundation

struct SkillListItem:Codable {
    let key:String
    let skills:[String]
    enum CodingKeys:String, CodingKey {
        case key = "title"
        case skills = "list"
    }
}
