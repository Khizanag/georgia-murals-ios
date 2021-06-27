//
//  LukaJaparidzeAndV45.swift
//  Tbilisi Murals Fest 1.0
//
//  Created by Giga Khizanishvili on 02.12.20.
//

import Foundation

// this class handles adding "Luka Japaridze & V45" artist info and murals

extension ArtistsDatabase {

	func loadLukaJaparidzeAndV45Info() {
		let muralsDB = MuralsDatabase.sharedInstance

		let artist = Artist(
			ID: getNextArtistID(),
			name: "Luka Japaridze & V45",
			profileImageURL: "Luka Japaridze & V45",
			bio: "Contemporary painter and street artist Luka japaridze was born December 21 1993 in Tbilisi. From 2012 he studing in “Tbilisi state academy of arts",
			socialProfiles: [
                SocialNetwork.facebook: "lukajaparidzeart",
			],
			murals: muralsDB.getMuralsOf(artist: "Luka Japaridze & V45")
		)

		addArtist(artist)
	}

}

extension MuralsDatabase {

	func addLukaJaparidzeAndV45Murals() {
		self.addMural(
			Mural(
				ID: getNextMuralID(),
				title: nil,
				imageURLs: [
					"Luka Japaridze & V45 - 2019 - 1",
				],
				artist: "Luka Japaridze & V45",
				description: nil,
				year: 2019,
				project: "Tbilisi Mural Fest",
				location: (41.6885404, 44.7882247),
				locationTitle: "5, Amagleba St."
			)
		)
	}

}
