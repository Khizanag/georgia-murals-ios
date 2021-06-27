//
//  SocialMediaManager.swift
//  Tbilisi Murals Fest 1.0
//
//  Created by Giga Khizanishvili on 27.06.21.
//

import Foundation

class SocialMediaManager {
    
    public static func buildFacebookUrl(username: String) -> String {
        return "https://www.facebook.com/\(username)/"
    }
    
    public static func buildInstagramUrl(username: String) -> String {
        return "https://www.instagram.com/\(username)/"
    }
}

enum SocialNetwork: String {
    case facebook = "facebook"
    case instagram = "instagram"
}
