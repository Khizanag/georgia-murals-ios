//
//  MapViewController.swift
//  Tbilisi Murals Fest
//
//  Created by macbook on 5/25/20.
//  Copyright © 2020 macbook. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    public static let identifier = "MapViewController"

	@IBOutlet weak var mapView: MKMapView!

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
		setupMap()
		createAnnotations()
	}
    
    // MARK: Setup
    private func setupMap() {
        mapView.delegate = self
    }

	func createAnnotations() {

		let artists = ArtistsDatabase.sharedInstance.getDataBase()

		for (_, artist) in artists {
			for mural in artist.murals {
				let location = mural.location
				let annotation = MKPointAnnotation()
				annotation.title = (String)(mural.ID)
				annotation.coordinate = CLLocationCoordinate2D(latitude: location.0 , longitude: location.1 )
				mapView.addAnnotation(annotation)
			}
		}

		let annotationForRegion = MKPointAnnotation()
		annotationForRegion.coordinate = CLLocationCoordinate2D(latitude: 42.3154, longitude: 43.3569)
		let region = MKCoordinateRegion(center: annotationForRegion.coordinate, latitudinalMeters: 4500, longitudinalMeters: 4500)
		mapView.setRegion(region, animated: true)
	}

}

// MARK: - MKMapViewDelegate
extension MapViewController: MKMapViewDelegate {

	func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
		let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        if let muralVC = storyBoard.instantiateViewController(withIdentifier: MuralViewController.identifier) as? MuralViewController {
			let muralIDStr = mapView.selectedAnnotations[0].title!!
			let muralID: Int = (Int)(muralIDStr)! // TODO may be error here
			muralVC.mural = MuralsDatabase.sharedInstance.getMural(ID: muralID)
			self.navigationController?.pushViewController(muralVC, animated: true)
			mapView.deselectAnnotation(view.annotation, animated: true)
		}
	}

	func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
		// Better to make this class property
		let annotationIdentifier = "AnnotationIdentifier"

		var annotationView: MKAnnotationView?
		if let dequeuedAnnotationView = mapView.dequeueReusableAnnotationView(withIdentifier: annotationIdentifier) {
			annotationView = dequeuedAnnotationView
			annotationView?.annotation = annotation
		}
		else {
			annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: annotationIdentifier)
			annotationView?.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)

		}

		if let annotationView = annotationView {
			annotationView.canShowCallout = true
            annotationView.image = Constants.Images.ping
		}

		return annotationView
	}
}
