//
//  SchoolDetailsMapCollectionViewCell.swift
//  20230803-DS-NYCSchools
//
//  Created by Dmitry Shlepkin on 8/7/23.
//

import UIKit
import MapKit

final class SchoolDetailsMapCollectionViewCell: UICollectionViewCell {
        
    private let mapView = MKMapView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        let allAnnotations = mapView.annotations
        mapView.removeAnnotations(allAnnotations)
        mapView.removeFromSuperview()
    }
    
}

// MARK: - Setup
private extension SchoolDetailsMapCollectionViewCell {
    
    func setup() {
        addSubview(mapView)
        mapView.delegate = self
        mapView.showsCompass = false
        mapView.showsUserLocation = false
        mapView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mapView.heightAnchor.constraint(equalToConstant: 200),
            mapView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            mapView.bottomAnchor.constraint(equalTo: bottomAnchor),
            mapView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
}

// MARK: - MKMapViewDelegate
extension SchoolDetailsMapCollectionViewCell: MKMapViewDelegate {}

extension SchoolDetailsMapCollectionViewCell {

    func updateWith(values: (String, String)) {
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(
            latitude: Double(values.0) ?? 0,
            longitude: Double(values.1) ?? 0
        )
        mapView.addAnnotation(annotation)
        let region = MKCoordinateRegion(
            center: annotation.coordinate,
            latitudinalMeters: CLLocationDistance(exactly: 5000)!,
            longitudinalMeters: CLLocationDistance(exactly: 5000)!
        )
        mapView.setRegion(mapView.regionThatFits(region), animated: true)
    }

}

