//
//  QUINTE55ENZ.swift
//  Tbilisi Murals Fest 1.0
//
//  Created by Giga Khizanishvili on 02.12.20.
//

import Foundation

// this class handles adding "Q U I N T E 5 5 E N Z" artist info and murals

extension ArtistsDatabase {

	func loadQUINTE55ENZInfo() {
		let muralsDB = MuralsDatabase.shared

		let artist = Artist(
			ID: getNextArtistID(),
			name: "Q U I N T E 5 5 E N Z",
			profileImageName: "Q U I N T E 5 5 E N Z",
			bio: "Together, the Hanover and Berlin-based artists Thomas Granseuer and Tomislav Topic constitute Quintessenz. Starting out as students at the University of applied Science and Arts in Hildesheim, they developed a unique an unmistakeable signature style. With roots in both grafitti-culture and chromatics, Quintessenz combine painting, moving image, and installation. Space is the fundamental inspiration for Quintessenz. Their work not only uses shapes and patterns found in architecture, it interferes with its environment, changing the spectators perception (of space). Quintessenz use old factory buildings as their canvases, with their murals covering entire facades. In every medium they use, both in public spaces and galleries, their abstract work shares one thing in common: their art makes/creates space for its color. To Quintessenz, color is more than form. It is the content itself.",
			socialProfiles: [
                .facebook : "QuintessenzCreation",
                .instagram: "quinte55enz",
			],
			murals: muralsDB.getMuralsOf(artist: "Q U I N T E 5 5 E N Z")
		)

		addArtist(artist)
	}

}

extension MuralsDatabase {

	func addQUINTE55ENZMurals() {
		self.addMural(
			Mural(
				ID: getNextMuralID(),
				title: "Abstract",
				imageURLs: [
					"Q U I N T E 5 5 E N Z - 2020 - 1",
				],
				artist: "Q U I N T E 5 5 E N Z",
				description: nil,
				year: 2019,
				project: "Tbilisi Mural Fest",
				location: (41.69464, 44.80937),
				locationTitle: "Noe Jordania Bank, near The Bridge of Peace"
			)
		)
	}

}
