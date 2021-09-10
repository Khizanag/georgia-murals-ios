//
//  MapConstants.swift
//  Tbilisi Murals Fest 1.0
//
//  Created by Giga Khizanishvili on 27.06.21.
//

import UIKit

extension MapViewController {
    struct Constants {
        struct Images {
            static let ping = UIImage(named: "ping")!
        }
        struct Sizes {
            static let pingWidth: CGFloat = 25
            static let pingHeight: CGFloat = 40
        }
        
        static let latitudinalMeters = 15_000.0
        static let longitudinalMeters = 15_000.0
        static let defaultLatitude = 41.716667
        static let defaultLongitude = 44.783333
    }
}
