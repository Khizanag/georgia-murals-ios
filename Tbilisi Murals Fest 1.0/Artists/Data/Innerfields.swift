//
//  Innerfields.swift
//  Tbilisi Murals Fest 1.0
//
//  Created by Giga Khizanishvili on 02.12.20.
//

import Foundation

// this class handles adding "Innerfields" artist info and murals

extension ArtistsDatabase {

	func loadInnerfieldsInfo() {
		let muralsDB = MuralsDatabase.shared

		let artist = Artist(
			ID: getNextArtistID(),
			name: "Innerfields",
			profileImageName: "Innerfields",
			bio: "Innerfields are the three artists Jakob Tory Bardou, Holger Weißflog and Veit Tempich. Born and based in Berlin, they‘ve been growing up with graffiti and various influences; they formed as a group in 1998. The artists like to reflekt their environment and create mostly figurative motives in a realistic manner, that are mixed with grafical elements and symbols. The human being, bound to being part of the nature and all to often opposed to it, is a major topic in their body of work. They are creating works of art as a proffession and love taking part in festivals and various art related projekts around the world",
			socialProfiles: [
                .facebook : "innerfields",
                .instagram: "innerfields",
			],
			murals: muralsDB.getMuralsOf(artist: "Innerfields")
		)

		addArtist(artist)
	}

}

extension MuralsDatabase {

	func addInnerfieldsMurals() {

		addMural(
			Mural(
				ID: getNextMuralID(),
				title: "Peacemakers",
				imageURLs: [
					"Innerfields - 2019 - 3",
				],
				artist: "Innerfields",
				description: nil,
				year: 2019,
				project: "Tbilisi Mural Fest",
				location: (41.71793, 44.7677),
				locationTitle: "20 Zaza Panaskertel-Tsitsishvili St, T'bilisi"
			)
		)

		addMural(
			Mural(
				ID: getNextMuralID(),
				title: "Locked Down In Golden Cage",
				imageURLs: [
					"Innerfields - 2020 - 1",
					"Innerfields - 2020 - 3",
					"Innerfields - 2020 - 4",
				],
				artist: "Innerfields",
				description: nil,
				year: 2020,
				project: "Tbilisi Mural Fest",
				location: (41.712367, 44.754235),
				locationTitle: "29g Ilia Chavchavadze Avenue, T'bilisi 0179"
			)
		)

		addMural(
			Mural(
				ID: getNextMuralID(),
				title: "Trust",
				imageURLs: [
					"Innerfields - 2020 - 5",
				],
				artist: "Innerfields",
				description: nil,
				year: 2020,
				project: "KIU Mural Fest",
				location: (42.203396,42.713208),
				locationTitle: "Kutaisi International University"
			)
		)
	}
}
