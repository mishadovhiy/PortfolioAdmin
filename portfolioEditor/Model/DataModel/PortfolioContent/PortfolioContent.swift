//
//  PortfolioContent.swift
//  portfolioEditor
//
//  Created by Misha Dovhiy on 25.08.2024.
//

import Foundation

struct PortfolioContent:Codable {
    var skills:[SkillListItem] {
        skillArray.compactMap {
            .init(key: $0.key, skills: $0.value)
        }
    }
    private var skillArray:[String:[String]]
    
    enum CodingKeys: String, CodingKey {
        case skillArray = "skills"
    }
    
    init(skills: [SkillListItem]) {
        skillArray = [:]
        skills.forEach {
            skillArray.updateValue($0.skills, forKey: $0.key)
        }
    }
}
