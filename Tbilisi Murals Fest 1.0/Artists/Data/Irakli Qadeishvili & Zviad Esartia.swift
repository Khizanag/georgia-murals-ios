//
//  Matthias Mross.swift
//  Tbilisi Murals Fest 1.0
//
//  Created by Giga Khizanishvili on 19.12.20.
//

import Foundation

// this class handles adding "Irakli Qadeishvili & Zviad Esartia" artist info and murals

extension ArtistsDatabase {

	func loadIrakliQadeishviliAndZviadEsartia() {
		let muralsDB = MuralsDatabase.shared

		let artist = Artist(
			ID: getNextArtistID(),
			name: "Irakli Qadeishvili & Zviad Esartia",
			profileImageURL: "Irakli Qadeishvili & Zviad Esartia",
			bio: "My name is Irakli Qadeishvili and I was born on 22nd of May, 1989 in Tbilisi, the capital of Georgia. I am an artist, muralist and an architect by profession. My passion for art started at an early age. When I was about four I made my first painting. The composition of the painting consisted of colorful circles – I tried to convey music through this picture.  Subsequently, drawing became the primary source of my communication. As growing up, I created paintings on huge canvases and papers. I actively participated in various junior exhibitions, so I gradually started to realize what I wanted to do for the rest of my life. In 2007, I started to study at Tbilisi State Academy of Arts. Then,  I decided to create a 3D anamorphic street art with my friends, which inspired me to create large-scale artworks and therefore change the surrounding environment with my work. As a result, my paintings moved into the streets. My city is full of drab and monotonous Soviet architecture, however my murals add a touch of color to this “concrete jungle”. I constantly try to use bright and vivid colors to diversify the gray facades of buildings, which accompanied me throughout my childhood with a dark stripe. \n\n Zviad Esartia's bio is in progress.",
			socialProfiles: [
                .facebook : "profile.php?id=100000738615032",
                .instagram: "iraklikadeishvili",
			],
			murals: muralsDB.getMuralsOf(artist: "Irakli Qadeishvili & Zviad Esartia")
		)

		addArtist(artist)
	}

}

extension MuralsDatabase {


	func addIrakliQadeishviliAndZviadEsartiaMurals() {
		self.addMural(
			Mural(
				ID: getNextMuralID(),
				title: "Care",
				imageURLs: [
					"Irakli Qadeishvili & Zviad Esartia - 1",
					"Irakli Qadeishvili & Zviad Esartia - 2",
				],
				artist: "Irakli Qadeishvili & Zviad Esartia",
				description: nil,
				year: 2020,
				project: "KIU Mural Fest",
				location: (42.203576,42.712834),
				locationTitle: "Kutaisi International University"
			)
		)
	}

}
