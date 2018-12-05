//
//  MatchPlayerEvent.swift
//  MatchResume
//
//  Created by Jorge Mendoza on 12/5/18.
//  Copyright © 2018 Jorge Mendoza. All rights reserved.
//

import Foundation

struct MatchPlayerEvent:Codable {

    let id: Int?
    
    let active: Bool?
    
    let instant: Int?
    
    let playerIn: Player?
    
    let playerOut: Player?
    
    let matchID: Match?
    
    let eventID: Event?
    
    let teamID: Int?
    
    let createdAt, updatedAt: String?
    
    let event: Event?
    
    let team: Team?
    
    enum CodingKeys: String, CodingKey {
        
        case id, active, instant
        
        case playerIn = "player_in"
        
        case playerOut = "player_out"
        
        case matchID = "match_id"
        
        case eventID = "event_id"
        
        case teamID = "team_id"
        
        case createdAt = "created_at"
        
        case updatedAt = "updated_at"
        
        case event, team
    }
    
}

struct Team:Codable{
    
    let id: Int?
    
    let description, shortName,logoURL, name, meta, portraitURL, createdAt, updatedAt: String?
    
    let subdisciplineID, genderID, organizationID, categoryTypeID: Int?
    
    let active: Bool?
    
    enum CodingKeys: String, CodingKey {
        
        case id, name
        
        case logoURL = "logo_url"
        
        case shortName = "short_name"
        
        case description
        
        case categoryTypeID = "category_type_id"
        
        case organizationID = "organization_id"
        
        case subdisciplineID = "subdiscipline_id"
        
        case genderID = "gender_id"
        
        case active
        
        case createdAt = "created_at"
        
        case updatedAt = "updated_at"
        
        case meta
        
        case portraitURL = "portrait_url"
    }
    
}

struct Player:Codable {
    
    let id, personID, teamID, positionID, number: Int?
    
    let active: Bool?
    
    let imgURL,createdAt, updatedAt, registeredAt, unregisteredAt: String?
    
    let person: Person?
    
    enum CodingKeys: String, CodingKey {
        
        case id, active, number
        
        case imgURL = "img_url"
        
        case registeredAt = "registered_at"
        
        case unregisteredAt = "unregistered_at"
        
        case personID = "person_id"
        
        case teamID = "team_id"
        
        case positionID = "position_id"
        
        case createdAt = "created_at"
        
        case updatedAt = "updated_at"
        
        case person
    }
}

struct Person:Codable{
    
    let id, genderID, statusTypeID: Int?
    
    let firstName, lastName, nickname, birthday, email, height, weight, imgURL, documentNumber, documentImgURL, nationality, meta, motto, portraitURL, createdAt, updatedAt : String?
    
    let active, claimed: Bool?
    
    let gender: Gender?
    
    enum CodingKeys: String, CodingKey {
        
        case id
        
        case firstName = "first_name"
        
        case lastName = "last_name"
        
        case nickname, birthday, email
        
        case genderID = "gender_id"
        
        case height, weight
        
        case statusTypeID = "status_type_id"
        
        case imgURL = "img_url"
        
        case documentNumber = "document_number"
        
        case documentImgURL = "document_img_url"
        
        case nationality, meta, claimed, active
        
        case createdAt = "created_at"
        
        case updatedAt = "updated_at"
        
        case motto
        
        case portraitURL = "portrait_url"
        
        case gender
    }
}

struct Event:Codable{
    
    let id: Int?
    
    let active: Bool?
    
    let imgURL: String?
    
    let name, description: String?
    
    let level, incrementsBy: Int?
    
    let code, createdAt, updatedAt: String?
    
    let subdisciplineID: Int?
    
    enum CodingKeys: String, CodingKey {
        
        case id, active
        
        case imgURL = "img_url"
        
        case name, description, level
        
        case incrementsBy = "increments_by"
        
        case code
        
        case createdAt = "created_at"
        
        case updatedAt = "updated_at"
        
        case subdisciplineID = "subdiscipline_id"
    }
    
}

struct Match:Codable{
    
    let createdAt, updatedAt, date, location: String?
    
    let id, visitorTeamScore, number, homeTeamID, homeTeamScore, visitorTeamID: Int?
    
    let played, active: Bool?
    
    let homeTeam, visitorTeam: Team?
    
    
    enum CodingKeys: String, CodingKey {
        
        case id, location, number
        
        case homeTeamID = "home_team_id"
        
        case homeTeamScore = "home_team_score"
        
        case visitorTeamID = "visitor_team_id"
        
        case visitorTeamScore = "visitor_team_score"
        
        case played, date, active
        
        case createdAt = "created_at"
        
        case updatedAt = "updated_at"
        
        case homeTeam = "home_team"
        
        case visitorTeam = "visitor_team"
    }
    
}

struct Gender:Codable{
    
    let id: Int?
    
    let name: String?
    
    let imageURL: String?
    
    let active: Bool?
    
    let createdAt, updatedAt, nameEn, nameEs: String?
    
    enum CodingKeys: String, CodingKey {
     
        case id, name
        
        case imageURL = "image_url"
        
        case active
        
        case createdAt = "created_at"
        
        case updatedAt = "updated_at"
        
        case nameEn = "name_en"
        
        case nameEs = "name_es"
    }
    
}
