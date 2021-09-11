//
//  Artist.swift
//  Tbilisi Murals Fest 1.0
//
//  Created by Giga Khizanishvili on 10/2/20.
//

import Foundation

class Artist {

    // MARK: - Properties
	public let ID: Int
	public let name: String
	public let profileImageName: String
	public let bio: String
    public let socialProfiles: [SocialNetwork: String]
	public var murals: [Mural]

    // MARK: - Init
	init(ID: Int, name: String, profileImageName: String, bio: String, socialProfiles: [SocialNetwork: String], murals: [Mural]) {
		self.ID = ID
		self.name = name
		self.profileImageName = profileImageName
		self.bio = bio
		self.socialProfiles = socialProfiles
		self.murals = murals
	}

	public func addMural(mural: Mural) {
		murals.append(mural)
	}
}
