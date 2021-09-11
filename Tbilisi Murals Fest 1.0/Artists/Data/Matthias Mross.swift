//
//  Matthias Mross.swift
//  Tbilisi Murals Fest 1.0
//
//  Created by Giga Khizanishvili on 19.12.20.
//

import Foundation

// this class handles adding "Matthias Mross.swift" artist info and murals

extension ArtistsDatabase {

	func loadMatthiasMross() {
		let muralsDB = MuralsDatabase.shared

		let artist = Artist(
			ID: getNextArtistID(),
			name: "Matthias Mross",
			profileImageName: "Matthias Mross",
			bio: "Matthias Mross, who was born in Freising (Germany) in 1986, is a Munich (Germany) based figurative painter. While doing classic graffiti as a juvenile, being more interested in creating complex timeintense paintings than in the thrill of bombing, his focus changed to doing more legal walls and comissions. He was allowed to skip the first year of his illustration studies being arrogant enough to convice the principal he wouldn´t need it. Being limited to the use of pencils, markers and Spraycans before, being forced to work with brushes opened up new worlds for him. Since graduating in 2009/2010 he is working as a self employed free painter.Besides large scale murals on building facades he creates realistic works on canvas combining thick impasto layers of paint with meticulously worked out details on top of repetitive floral patterns or other especial fabrics. The media he uses therefore contain acrylics, spraypaint, fabrics, brushes, spatulas, collages and more.The subjects of these paintings are scenes experieced by the artist in the streets of various international Metropoles he visited over the years in the course of his work. The protagonists of these scenes range from homeless from L.A., marrocan Street Vendors, soup chicken from Saigon, to Cowboy Kids from Dublin.",
			socialProfiles: [
                .instagram: "matthiasmross",
			],
			murals: muralsDB.getMuralsOf(artist: "Matthias Mross")
		)

		addArtist(artist)
	}

}

extension MuralsDatabase {

	func addMatthiasMrossMurals() {
		self.addMural(
			Mural(
				ID: getNextMuralID(),
				title: "Knowledge Is Power",
				imageURLs: [
					"Matthias Mross - 1",
					"Matthias Mross - 3",
					"Matthias Mross - 4",
				],
				artist: "Matthias Mross",
				description: nil,
				year: 2020,
				project: "KIU Mural Fest",
				location: (42.202436,42.714675),
				locationTitle: "Kutaisi International University"
			)
		)
	}

}
