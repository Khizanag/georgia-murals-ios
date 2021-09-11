//
//  NoahAndAphe.swift
//  Tbilisi Murals Fest 1.0
//
//  Created by Giga Khizanishvili on 02.12.20.
//

import Foundation

// this class handles adding "Noah & Aphe" artist info and murals

extension ArtistsDatabase {

	func loadNoahAndApheInfo() {
		let muralsDB = MuralsDatabase.shared

		let artist = Artist(
			ID: getNextArtistID(),
			name: "Noah & Aphe",
			profileImageName: "Noah Kauertz and Aphe",
			bio: "The artists APHE (Oliver Hollatz, 29 years old) and NOAH (Noah Kauertz, 26 years old) got to know each other during their art studies in Bonn. Their common interest in art in public spaces and their passion for painting led to the first collaboration in the form of a facade design in 2019. In the same year, four more murals were created, which significantly shaped the collaboration between the artists in terms of color, style and subject. Her dialogic painting moves fluidly between representation and abstraction and is strongly influenced by an atmospheric color aesthetic.",
			socialProfiles: [
                .instagram: "aphenoah",
			],
			murals: muralsDB.getMuralsOf(artist: "Noah & Aphe")
		)

		addArtist(artist)
	}

}

extension MuralsDatabase {

	func addNoahAndApheMurals() {
		self.addMural(
			Mural(
				ID: getNextMuralID(),
				title: nil,
				imageURLs: [
					"Noah Kauertz and Aphe - 4",
					"Noah Kauertz and Aphe - 2020 - 1",
				],
				artist: "Noah & Aphe",
				description: nil,
				year: 2020,
				project: "Tbilisi Mural Fest",
				location: (41.718906,44.758839),
				locationTitle: "1 Zaza Panaskertel-Tsitsishvili St, T'bilisi"
			)
		)
	}

}
