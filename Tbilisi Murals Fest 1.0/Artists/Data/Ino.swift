//
//  Ino.swift
//  Tbilisi Murals Fest 1.0
//
//  Created by Giga Khizanishvili on 02.12.20.
//

import Foundation

// this class handles adding "Ino" artist info and murals

extension ArtistsDatabase {

	func loadInoInfo() {
		let muralsDB = MuralsDatabase.shared

		let artist = Artist(
			ID: getNextArtistID(),
			name: "INO",
			profileImageName: "Ino",
			bio: "Best known for his outstanding figurative murals created on a large scale, INO is one of the most internationally recognized Greek street artist. Although he began his career as a graffiti artist in the early 2000s by producing letters and bombing, over the years he has developed his distinctive style characterized by fragmented forms, photorealistic elements and grayscale color palette with touches of light blue. His eye-catching, stylized and clever pieces often deal with social and political themes that affect the average man and woman, creating a dialogue between the viewer and the art.",
			socialProfiles: [
                .facebook : "inoexpo",
                .instagram: "inoexpo",
			],
			murals: muralsDB.getMuralsOf(artist: "INO")
		)

		addArtist(artist)
	}

}

extension MuralsDatabase {

	func addInoMurals() {
		self.addMural(
			Mural(
				ID: getNextMuralID(),
				title: nil,
				imageURLs: [
					"Ino - 2020 - 1",
				],
				artist: "INO",
				description: nil,
				year: 2020,
				project: "KIU Mural Fest",
				location: (42.203708,42.712874),
				locationTitle: "Kutaisi International University"
			)
		)

		self.addMural(
			Mural(
				ID: getNextMuralID(),
				title: "Blue Angel",
				imageURLs: [
					"Ino - 2020 - 2",
					"Ino - 2020 - 3",
					"Ino - 2020 - 4",
				],
				artist: "INO",
				description: nil,
				year: 2020,
				project: "Tbilisi Mural Fest",
				location: (41.791108,44.819319),
				locationTitle: "Martin Nozadze St. 8, Tbilisi"
			)
		)

		self.addMural(
			Mural(
				ID: getNextMuralID(),
				title: "Overthinker",
				imageURLs: [
					"Ino - 6"
				],
				artist: "INO",
				description: nil,
				year: 2020,
				project: "KIU Mural Fest",
				location: (42.203702,42.712723),
				locationTitle: "Kutaisi International University"
			)
		)
	}

}
