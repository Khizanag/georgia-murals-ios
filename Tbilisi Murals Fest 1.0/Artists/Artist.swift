//
//  Artist.swift
//  Tbilisi Murals Fest 1.0
//
//  Created by Giga Khizanishvili on 10/2/20.
//

import Foundation

class Artist {

	public let ID: Int
	public let name: String
	public let profileImageURL: String
	public let bio: String
    public let socialProfiles: [SocialNetwork: String]
	public var murals: [Mural]

	init(ID: Int, name: String, profileImageURL: String, bio: String, socialProfiles: [SocialNetwork: String], murals: [Mural]) {
		self.ID = ID
		self.name = name
		self.profileImageURL = profileImageURL
		self.bio = bio
		self.socialProfiles = socialProfiles
		self.murals = murals
	}

	public func addMural(mural: Mural) {
		murals.append(mural)
	}
}
