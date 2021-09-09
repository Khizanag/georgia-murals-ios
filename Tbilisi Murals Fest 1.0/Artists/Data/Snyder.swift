//
//  ArtistSnyder.swift
//  Tbilisi Murals Fest 1.0
//
//  Created by Giga Khizanishvili on 02.12.20.
//

import Foundation

// this class handles adding "Snyder" artist info and murals

extension ArtistsDatabase {

	func loadSnyderInfo() {
		let muralsDB = MuralsDatabase.shared

		let artist = Artist(
			ID: getNextArtistID(),
			name: "SNYDER",
			profileImageURL: "Snyder",
			bio: "A quarter of a century ago, Berlin-based SNYDER started his graffiti career. Besides his installations of letterform sculptures in public space and stencil-based figurations his works on trains primarily inform his creations. He uses the context, approach and technical craftsmanship of graffiti to develop a veil in which he wraps walls, railway traffic signs and the very trains. These objects of order, expressions of rules and definitions that regulate our everyday life and provide security stand opposed to the desire for freedom and impetuousness that we draw strength from. They get occupied by the artist in an interplay of order and arbitrariness, of regimentation and freedom that reveals the fascination that SNYDER in his youth found in graffiti writing.",
			socialProfiles: [
                .instagram: "snyder_berlin"
            ],
			murals: muralsDB.getMuralsOf(artist: "SNYDER")
		)

		addArtist(artist)
	}

}

extension MuralsDatabase {

	func addSnyderMurals() {
		self.addMural(
			Mural(
				ID: getNextMuralID(),
				title: "Zebras",
				imageURLs: [
					"Snyder - 2019 - 4",
					"Snyder - 2019 - 5",
				],
				artist: "SNYDER",
				description: nil,
				year: 2019,
				project: "Tbilisi Mural Fest",
				location: (41.71535, 44.76987),
				locationTitle: "39 Meliton And Andria Balanchivadze St, near Simon Chikovani St."
			)
		)
	}

}
