//
//  Mural.swift
//  Tbilisi Murals Fest 1.0
//
//  Created by Giga Khizanishvili on 01.12.20.
//

import Foundation
import UIKit

class Mural {

	public let ID: Int
	public let title: String?
	public let imageURLs: [String]
	public let artist: String
	public let description: String?
	public let year: Int?
	public let project: String?
	public let location: (Double, Double)
	public let locationTitle: String?

	init(ID: Int, title: String?, imageURLs: [String], artist: String, description: String?,
		 year: Int?, project: String?, location: (Double, Double), locationTitle: String?) {
		self.ID = ID
		self.title = title
		self.imageURLs = imageURLs
		self.artist = artist
		self.description = description
		self.year = year
		self.project = project
		self.location = location
		self.locationTitle = locationTitle
	}

}
