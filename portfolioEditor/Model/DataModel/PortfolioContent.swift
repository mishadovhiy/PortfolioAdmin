//
//  PortfolioContent.swift
//  portfolioEditor
//
//  Created by Misha Dovhiy on 25.08.2024.
//

import Foundation

struct PortfolioContent:Codable {
    let cgProjectKeyList:[String]
    private var skillArray:[String:[String]]
    let projectSkillList:[String:[String]]
    let projectList:[[String:String]]
    let education:[EducationInstitution]
    let courses:[EducationInstitution]
    let title:String
    let description: String
    let about: String
    let workExperience:[WorkExperience]
    
    enum CodingKeys: String, CodingKey {
        case skillArray = "skills"
        case cgProjectKeyList
        case projectSkillList
        case projectList
        case education
        case courses
        case title
        case description
        case about
        case workExperience
    }
    
    var skills:[SkillListItem] {
        skillArray.compactMap {
            .init(key: $0.key, skills: $0.value)
        }
    }
}

extension PortfolioContent {
    struct SkillListItem:Codable {
        let key:String
        let skills:[String]
        enum CodingKeys:String, CodingKey {
            case key = "title"
            case skills = "list"
        }
    }
    
    struct WorkExperience:Codable {
        let companyName:String
        let workTitle:String
        let companyURL:String
        let projectURLList:[String]
        let dateFrom:String
        let dateTo:String
        let skillList:String
        let descriptions:[String]
        let workType:String
        let managementType:String
        var descriptionText:String {
            return descriptions.joined(separator: ", ")
        }
    }
    
    struct EducationInstitution: Codable {
        let institutionTitle: String
        let description: String
        let date: String
    }
    
    struct ContactInfo: Codable {
        let title:String
    }
}
