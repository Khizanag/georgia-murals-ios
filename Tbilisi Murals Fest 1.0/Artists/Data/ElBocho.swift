//
//  ElBocho.swift
//  Tbilisi Murals Fest 1.0
//
//  Created by Giga Khizanishvili on 02.12.20.
//

import Foundation

// this class handles adding "Snyder" artist info and murals

extension ArtistsDatabase {

	func loadElBochoInfo() {
		let muralsDB = MuralsDatabase.shared

		let artist = Artist(
			ID: getNextArtistID(),
			name: "El Bocho",
			profileImageName: "El Bocho",
			bio: "El Bocho is a Berlin based artist. He has been working on the streets since 1997 and is by now amongst the most famous and visible street artists in Berlin. Communication and references to urban life are the main components of his work. El Bocho considers himself as an observed observer. It is important to him to work outside the art scene, as this reaches an audience that does not visit art specific locations like galleries or museums. El Bocho picks up the reaction s of the viewers and uses them in his works. This creates a constant flow of communication with the public.",
			socialProfiles: [
                .facebook : "elbochoberlin",
                .instagram: "elbochoberlin",
			],
			murals: muralsDB.getMuralsOf(artist: "El Bocho")
		)

		addArtist(artist)
	}

}

extension MuralsDatabase {

	func addElBochoMurals() {
		self.addMural(
			Mural(
				ID: getNextMuralID(),
				title: nil,
				imageURLs: [
					"El Bocho - 2019 - 1",
					"El Bocho - 2019 - 2",
				],
				artist: "El Bocho",
				description: nil,
				year: 2019,
				project: "Tbilisi Mural Fest",
				location: (41.7209, 44.78852),
				locationTitle: "182 Davit Aghmashenebeli Ave, T'bilisi"
			)
		)
	}

}
