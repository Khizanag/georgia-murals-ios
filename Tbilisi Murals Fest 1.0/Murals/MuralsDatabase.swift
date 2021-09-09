//
//  MuralsDatabase.swift
//  Tbilisi Murals Fest 1.0
//
//  Created by Giga Khizanishvili on 01.12.20.
//

import Foundation

class MuralsDatabase {

	static let shared = MuralsDatabase()

	private var nextMuralID: Int
	private var muralsOf: [String : [Mural]]
	private var murals: [Mural]					// used for returning all murals
	private var muralByID: [Int : Mural]

	public var defaultMural: Mural = Mural(ID: -1, title: "DefaultMural", imageURLs: [], artist: "DefaultArtist", description: nil, year: nil, project: nil, location: (-1,-1), locationTitle: nil)

	private init() {

		// init stored properties
		nextMuralID = 0
		muralsOf = [String : [Mural]]()
		muralByID = [Int : Mural]()
		murals = [Mural]()

		addMurals()
	}

	private func addMurals() {
		addArtezMurals()
		addCaseMaclaimMurals()
		addCollinVanderSlujisMurals()
		addDanteMurals()
		addElBochoMurals()
		addGiorgiMaskharashviliMurals()
		addHRVBMurals()
		addInnerfieldsMurals()
		addInoMurals()
		addIrakliQadeishviliAndZviadEsartiaMurals()
		addKeraMurals()
		addLukaJaparidzeAndV45Murals()
		addMatthiasMrossMurals()
		addMusyaMurals()
		addNoahAndApheMurals()
		addQUINTE55ENZMurals()
		addSnyderMurals()
	}

	public func addMural(_ mural: Mural) {
		if muralsOf[mural.artist] != nil {
			muralsOf[mural.artist]!.append(mural)
		} else {
			muralsOf[mural.artist] = [mural]
		}
		muralByID[mural.ID] = mural
		murals.append(mural)
	}

	public func getMural(ID: Int) -> Mural {
		return muralByID[ID]!
	}

	public func getNextMuralID() -> Int {
		let nextID = nextMuralID
		nextMuralID += 1 // increase for next call
		return nextID
	}

	public func getMuralsOf(artist: String) -> [Mural] {
		return muralsOf[artist]!
	}

	public func getMurals() -> [Mural] {
		return murals
	}

	public func getMuralsCount() -> Int {
		return murals.count
	}

}
