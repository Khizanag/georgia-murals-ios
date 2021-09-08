//
//  Musya.swift
//  Tbilisi Murals Fest 1.0
//
//  Created by Giga Khizanishvili on 02.12.20.
//

import Foundation

// this class handles adding "Musya" artist info and murals

extension ArtistsDatabase {

	func loadMusyaInfo() {
		let muralsDB = MuralsDatabase.sharedInstance

		let artist = Artist(
			ID: getNextArtistID(),
			name: "Musya",
			profileImageURL: "Musya",
			bio: "Born and raised in Georgia, a former Soviet Union country in the far east of Europe. At the age of 16, moved to capital city of Georgia, Tbilisi. Currently25 years old and is based in Tbilisi. She has chosen her occupation since childhood. She always knew that She would do nothing, but only art. Afterwards, while studying at Art Academy she decided to study Graphical Design and elaborated her knowledge in this field. Nowadays she is working as an Art Director in one of the most successful advertising companies in Georgia and also, is pursuing some side projects commercial and non-commercial. She is using different techniques for working, such as painting digital illustrations, hand-painting, wall painting, streetart and stencil; She is also occupied with creating some handicrafts and jewelry.",
			socialProfiles: [
                .facebook : "musyasart",
                .instagram: "musyaqeburia",
			],
			murals: muralsDB.getMuralsOf(artist: "Musya")
		)

		addArtist(artist)
	}

}

extension MuralsDatabase {

	func addMusyaMurals() {
		self.addMural(
			Mural(
				ID: getNextMuralID(),
				title: nil,
				imageURLs: [
					"Musya - 2019 - 1",
					"Musya - 1",
					"Musya - 2",
				],
				artist: "Musya",
				description: nil,
				year: 2019,
				project: "Tbilisi Mural Fest",
				location: (41.70741, 44.79444),
				locationTitle: "Left of M'tkvari, Nearby 33 Ushangi Chkheidze Street, T'bilisi"
			)
		)
	}

}
