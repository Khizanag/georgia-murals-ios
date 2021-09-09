//
//  GiorgiMaskharashvili.swift
//  Tbilisi Murals Fest 1.0
//
//  Created by Giga Khizanishvili on 02.12.20.
//

import Foundation

// this class handles adding "Snyder" artist info and murals

extension ArtistsDatabase {

	func loadGiorgiMaskharashviliInfo() {
		let muralsDB = MuralsDatabase.shared

		let artist = Artist(
			ID: getNextArtistID(),
			name: "Giorgi Maskharashvili",
			profileImageURL: "Giorgi Maskharashvili",
			bio: "Giorgi Maskharashvili was born in Tbilisi in 1977. He first studied at the Tbilisi Academy of Arts, Faculty of Easel Graphics, and then at the Film Directing Faculty of the Georgian State University of Theater and Film. Works as a film and television actor, director and artist",
			socialProfiles: [
                .instagram: "maskhari",
			],
			murals: muralsDB.getMuralsOf(artist: "Giorgi Maskharashvili")
		)

		addArtist(artist)
	}

}

extension MuralsDatabase {

	func addGiorgiMaskharashviliMurals() {
		self.addMural(
			Mural(
				ID: getNextMuralID(),
				title: nil,
				imageURLs: [
					"Giorgi Maskharashvili - 2020 - 1",
				],
				artist: "Giorgi Maskharashvili",
				description: nil,
				year: 2020,
				project: "Tbilisi Mural Fest",
				location: (41.7209, 44.78852),
				locationTitle: "182 Davit Aghmashenebeli Ave, T'bilisi"
			)
		)
	}

}
