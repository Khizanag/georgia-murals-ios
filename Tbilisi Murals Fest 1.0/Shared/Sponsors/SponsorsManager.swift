//
//  SponsorsManager.swift
//  Tbilisi Murals Fest 1.0
//
//  Created by Giga Khizanishvili on 27.06.21.
//

import Foundation

class SponsorsManager {
    public static func getSponsorImageNames() -> [String] {
        return [
            "meria",
            "rebank",
            "adjara",
            "alpina",
            "montana",
            "cola",
            "kingdavid",
        ]
    }
}

extension SponsorsManager {
    struct Constants {
        static let eachSponsorShowTime = 2.25
    }
}
