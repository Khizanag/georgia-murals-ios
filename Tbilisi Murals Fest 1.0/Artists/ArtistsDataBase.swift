//
//  ArtistsDataBase.swift
//  Tbilisi Murals Fest 1.0
//
//  Created by Giga Khizanishvili on 10/2/20.
//

import Foundation

class ArtistsDatabase {

	static let sharedInstance = ArtistsDatabase()
    static let defaultArtist = Artist(ID: -1, name: "DefaultArtist", profileImageURL: "DefaultArtist", bio: "Default Bio", socialProfiles: [:], murals: [])
    
	var data: [String : Artist]
	var dataByID: [Int : Artist]
	private var nextArtistID: Int

	private init(){
		data = [String : Artist]()
		dataByID = [Int : Artist]()
		nextArtistID = 0
		loadArtezInfo()
		loadCaseMaclaimInfo()
		loadCollinVanderSlujisInfo()
		loadDanteInfo()
		loadElBochoInfo()
		loadGiorgiMaskharashviliInfo()
		loadHRVBInfo()
		loadInnerfieldsInfo()
		loadInoInfo()
		loadIrakliQadeishviliAndZviadEsartia()
		loadKeraInfo()
		loadLukaJaparidzeAndV45Info()
		loadMatthiasMross()
		loadMusyaInfo()
		loadNoahAndApheInfo()
		loadQUINTE55ENZInfo()
		loadSnyderInfo()
	}

	public func addArtist(_ artist: Artist) {
		data[artist.name] = artist
		dataByID[artist.ID] = artist
	}

	public func getDataBase() -> [String : Artist] {
		return data
	}

	public func getArtist(name: String) -> Artist? {
		return data[name]
	}

	public func getArtist(ID: Int) -> Artist? {
		return dataByID[ID]
	}

	public func getArtistsCount() -> Int {
		return data.count
	}

	public func getNextArtistID() -> Int {
		let nextID = nextArtistID
		nextArtistID += 1
		return nextID
	}

}
