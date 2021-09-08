//
//  Dante.swift
//  Tbilisi Murals Fest 1.0
//
//  Created by Giga Khizanishvili on 02.12.20.
//

import Foundation

// this class handles adding "Dante" artist info and murals

extension ArtistsDatabase {

	func loadDanteInfo() {
		let muralsDB = MuralsDatabase.sharedInstance

		let artist = Artist(
			ID: getNextArtistID(),
			name: "Dante",
			profileImageURL: "Dante",
			bio: "Born in 1987. Started to paint at an early age. His original source of inspiration was fauna. Drawing animals from book illustrations at first, he soon became a frequent guest of Tbilisi Zoo. In 2004 he enrolled in Tbilisi Academy of Arts, working towards a degree in interior design. From that time he actively started to work on murals. His first personal exhibition “All that Jazz” was opened during Tbilisi Jazz Festival in 2014. Young Lions Georgia gold winner in 2017. Today he’s an art director at JWT Metro.",
			socialProfiles: [
                .instagram : "dante.mdante",
			],
			murals: muralsDB.getMuralsOf(artist: "Dante")
		)

		addArtist(artist)
	}

}

extension MuralsDatabase {

	func addDanteMurals() {
		self.addMural(
			Mural(
				ID: getNextMuralID(),
				title: nil,
				imageURLs: [
					"Dante - 2020 - 1",
					"Dante - 2020 - 2",
					"Dante - 2020 - 3",
				],
				artist: "Dante",
				description: nil,
				year: 2020,
				project: "Tbilisi Mural Fest",
				location: (41.711564, 44.768289),
				locationTitle: "Ilia Chavchavadze Deal And/Nino Ramishvili Street, 27-27a Nino Ramishvili III Dead End, T'bilisi"
			)
		)
	}

}
