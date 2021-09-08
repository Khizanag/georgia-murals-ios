//
//  Kera.swift
//  Tbilisi Murals Fest 1.0
//
//  Created by Giga Khizanishvili on 02.12.20.
//

import Foundation

// this class handles adding "Kera" artist info and murals

extension ArtistsDatabase {

	func loadKeraInfo() {
		let muralsDB = MuralsDatabase.sharedInstance

		let artist = Artist(
			ID: getNextArtistID(),
			name: "Kera",
			profileImageURL: "Kera",
			bio: "“Kera“ who was born in Berlin in 1985 occupies himself with colours, printing techniques and facade design over more than 19 years. At the same time Kera always found new impulses through his love for haptic and technically things. Especiall y the interconnection of working with the computer and the realization on the wall attract the artist. When looking at his artwork one sees a reflection of his graphic-design studies, his passion for geometric lines and spaces",
			socialProfiles: [
                .facebook : "kera1kera1",
                .instagram: "kera.1",
			],
			murals: muralsDB.getMuralsOf(artist: "Kera")
		)

		addArtist(artist)
	}

}

extension MuralsDatabase {

	func addKeraMurals() {
		self.addMural(
			Mural(
				ID: getNextMuralID(),
				title: "Abstract",
				imageURLs: [
					"Kera - 2019 - 1",
					"Kera - 2019 - 2",
					"Kera - 2",
				],
				artist: "Kera",
				description: nil,
				year: 2019,
				project: "Tbilisi Mural Fest",
				location: (41.71941, 44.75927),
				locationTitle: "30 Bakhtrioni St, T'bilisi"
			)
		)
	}

}
