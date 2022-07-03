//
//  TokenData.swift
//  MediaSoft_TZ
//
//  Created by Marat Yunusov on 30.06.2022.
//

import Foundation

struct TokenData: Codable {
    
    let tokenType: String
    let refreshTokenExpiresIn: Int
    let refreshToken, scope, resourceOwner: String
    let expiresIn: Int
    let accessToken: String

    enum CodingKeys: String, CodingKey {
        case tokenType = "token_type"
        case refreshTokenExpiresIn = "refresh_token_expires_in"
        case refreshToken = "refresh_token"
        case scope
        case resourceOwner = "resource_owner"
        case expiresIn = "expires_in"
        case accessToken = "access_token"
    }
}
