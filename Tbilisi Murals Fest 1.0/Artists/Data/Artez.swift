//
//  Artez.swift
//  Tbilisi Murals Fest 1.0
//
//  Created by Giga Khizanishvili on 02.12.20.
//

import Foundation

// this class handles adding "Artez" artist info and murals

extension ArtistsDatabase {

	func loadArtezInfo() {
		let muralsDB = MuralsDatabase.shared

		let artist = Artist(
			ID: getNextArtistID(),
			name: "Artez",
			profileImageURL: "Artez",
			bio: "Artez is a Serbian artist whose style is defined as a mixing photorealism with illustration. He draws inspiration for his works, besides location, from the things and persons that are present in his everyday life. He usually has a photo of something that inspires him as a starting point, but during the painting process he improvises a lot, mostly because he likes to get inspiration from the site itself. For years he was trying to find the best way to express himself and transfer ideas from his head to the flat surface – wall. Along the way, he has been working with 2D and 3D letters, different types and styles of characters, photorealism, and in the end he got stuck with the mix of “little bit from everything”.",
			socialProfiles: [
                .facebook  : "ArtezStreetArt",
                .instagram : "artez_online",
			],
			murals: muralsDB.getMuralsOf(artist: "Artez")
		)

		addArtist(artist)
	}

}

extension MuralsDatabase {


	func addArtezMurals() {
		self.addMural(
			Mural(
				ID: getNextMuralID(),
				title: nil,
				imageURLs: [
					"Artez - 2020 - 2",
					"Artez - 2020 - 3",
					"Artez - 2020 - 5",
				],
				artist: "Artez",
				description: nil,
				year: 2020,
				project: "Tbilisi Mural Fest",
				location: (41.706078, 44.876030),
				locationTitle: "Varketili III Mic. B: 327, near park"
			)
		)

		self.addMural(
			Mural(
				ID: getNextMuralID(),
				title: "Girl With Cat",
				imageURLs: [
					"Artez - 2020 - 1",
					"Artez - 2020 - 4",
				],
				artist: "Artez",
				description: nil,
				year: 2020,
				project: "KIU Mural Fest",
				location: (42.204419,42.712932),
				locationTitle: "Kutaisi International University"
			)
		)
	}

}
