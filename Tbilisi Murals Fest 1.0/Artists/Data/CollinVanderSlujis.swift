//
//  CollinVanderSlujis.swift
//  Tbilisi Murals Fest 1.0
//
//  Created by Giga Khizanishvili on 02.12.20.
//

import Foundation

// this class handles adding "Collin Vander Slujis" artist info and murals

extension ArtistsDatabase {

	func loadCollinVanderSlujisInfo() {
		let muralsDB = MuralsDatabase.sharedInstance

		let artist = Artist(
			ID: getNextArtistID(),
			name: "Collin Vander Slujis",
			profileImageURL: "Collin Vander Slujis",
			bio: "Works and lives in Maastricht, The Netherlands. The work from Collin van der Sluijs has been publicated in magazines, books, and shown in galleries and project-spaces or walls in The Netherlands, Germany, France, England, Belgium, The U.S.A, Luxemburg, Italy, United Kingdom, Spain",
			socialProfiles: [
                .facebook : "collinvandersluijs",
                .instagram: "collinvandersluijs",
			],
			murals: muralsDB.getMuralsOf(artist: "Collin Vander Slujis")
		)

		addArtist(artist)
	}

}

extension MuralsDatabase {

	func addCollinVanderSlujisMurals() {
		addMural(
			Mural(
				ID: getNextMuralID(),
				title: "The Tbilisi Legend",
				imageURLs: [
					"Collin Vander Slujis - 2019 - 1",
					"Collin Vander Slujis - 2019 - 3",
					"Collin Vander Slujis - 2019 - 4",
				],
				artist: "Collin Vander Slujis",
				description: nil,
				year: 2019,
				project: "Tbilisi Mural Fest",
				location: (41.71874, 44.75786),
				locationTitle: "Kakutsa Cholokashvili Hwy, T'bilisi, near Tbilisi Hippodrome"
			)
		)
	}

}
