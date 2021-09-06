//
//  CaseMaclaim.swift
//  Tbilisi Murals Fest 1.0
//
//  Created by Giga Khizanishvili on 02.12.20.
//

import Foundation

// this class handles adding "Case Maclaim" artist info and murals

extension ArtistsDatabase {

	func loadCaseMaclaimInfo() {
		let muralsDB = MuralsDatabase.sharedInstance

		let artist = Artist(
			ID: getNextArtistID(),
			name: "Case Maclaim",
			profileImageURL: "Case Maclaim",
			bio: "A German urban artist native to Frankfurt, Andres Von Chrzanowski (a.k.a. CASE or CASE Maclaim) is a graffiti painter who relies on his highly developed talent to create pieces that combine brilliant photorealism with a strong note of surrealism. This artist primarily uses spray paint as this street art technique enables him to get the most out of his visuals and achieve the level of perfection his incredibly life-like graffiti possess. One of Andres Von Chrzanowski’s most common pictorial motifs are the overlaying hands that symbolize unity and power. It should also be noted that CASE is a founding member of the renown East- Germany Maclaim Crew, a group that has been the urban expression’s photorealism pioneer for over two decades now.",
			socialProfiles: [
                .facebook : "case_maclaim-104007173027340",
                .instagram: "case_maclaim",
			],
			murals: muralsDB.getMuralsOf(artist: "Case Maclaim")
		)

		addArtist(artist)
	}

}

extension MuralsDatabase {

	func addCaseMaclaimMurals() {
		self.addMural(
			Mural(
				ID: getNextMuralID(),
				title: nil,
				imageURLs: [
					"Case Maclaim - 2019 - 1",
					"Case Maclaim - 2019 - 3",
					"Case Maclaim - 2019 - 4",
				],
				artist: "Case Maclaim",
				description: nil,
				year: 2019,
				project: "Tbilisi Mural Fest",
				location: (41.71036, 44.76784),
				locationTitle: "23 Nino Ramishvili III Dead End, T'bilisi"
			)
		)

		self.addMural(
			Mural(
				ID: getNextMuralID(),
				title: "Seraphite",
				imageURLs: [
					"Case Maclaim - 2020 - 1",
					"Case Maclaim - 2020 - 2",
					"Case Maclaim - 2020 - 3",
					"Case Maclaim - 2020 - 4",
				],
				artist: "Case Maclaim",
				description: nil,
				year: 2020,
				project: "Tbilisi Mural Fest",
				location: (41.700797, 44.793347),
				locationTitle: "20 Alexander Griboedov St, T'bilisi"
			)
		)

		self.addMural(
			Mural(
				ID: getNextMuralID(),
				title: nil,
				imageURLs: [
					"Case Maclaim - 2020 - 5",
				],
				artist: "Case Maclaim",
				description: nil,
				year: 2020,
				project: "KIU Mural Fest",
				location: (42.203262,42.713206),
				locationTitle: "Kutaisi International University"
			)
		)
	}

}
