//
//  Welcome.swift
//  SocialApp
//
//  Created by Rishop Babu on 28/09/23.
//

import Foundation

// MARK: - Welcome

struct WelcomeModel: Codable {
    var message: String
}


// MARK: - Login Model

struct LoginModel: Codable {
    let message, accessToken, tokenType: String
    let userDetail: UserDetail
    
    enum CodingKeys: String, CodingKey {
        case message
        case accessToken = "access_token"
        case tokenType = "token_type"
        case userDetail = "user_detail"
    }
}

struct UserDetail: Codable {
    let id: Int
    let firstName, lastName, phone, email: String
    let profilePic, updatedBy: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case phone, email
        case profilePic = "profile_pic"
        case updatedBy = "updated_by"
    }
}
