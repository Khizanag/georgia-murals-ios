//
//  HRVB.swift
//  Tbilisi Murals Fest 1.0
//
//  Created by Giga Khizanishvili on 02.12.20.
//

import Foundation

// this class handles adding "HRVB" artist info and murals

extension ArtistsDatabase {

	func loadHRVBInfo() {
		let muralsDB = MuralsDatabase.sharedInstance

		let artist = Artist(
			ID: getNextArtistID(),
			name: "HRVB",
			profileImageURL: "HRVB",
			bio: "Freelance graphiti artist and illustrator located in Berlin since 2009. member of The Weird - crew of talented artist all over Germany and Austria.",
			socialProfiles: [
                .facebook : "hrvb123",
                .instagram: "hrvbtheweird",
			],
			murals: muralsDB.getMuralsOf(artist: "HRVB")
		)

		addArtist(artist)
	}

}

extension MuralsDatabase {

	func addHRVBMurals() {
		self.addMural(
			Mural(
				ID: getNextMuralID(),
				title: "Sweet Wall",
				imageURLs: [
					"HRVB - 1",
					"HRVB - 2",
					"HRVB - 3",
				],
				artist: "HRVB",
				description: nil,
				year: 2019,
				project: "Tbilisi Mural Fest",
				location: (41.71733, 44.75956),
				locationTitle: "Kakutsa Cholokashvili Hwy, T'bilisi, near Tbilisi Hippodrome"
			)
		)
	}

}
