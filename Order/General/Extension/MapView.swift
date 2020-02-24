//
//  MapOperator.swift
//  Order
//
//  Created by Yangsheng Zou on 2020-02-23.
//  Copyright © 2020 Yangsheng. All rights reserved.
//

import MapKit


extension MKMapView {
    
    func showRouteOnMap(path: RoutePath) {
        let sourcePlacemark = MKPlacemark(coordinate: CLLocationCoordinate2D(location: path.source), addressDictionary: nil)
        let destinationPlacemark = MKPlacemark(coordinate: CLLocationCoordinate2D(location: path.destination), addressDictionary: nil)

        let sourceMapItem = MKMapItem(placemark: sourcePlacemark)
        let destinationMapItem = MKMapItem(placemark: destinationPlacemark)

        let sourceAnnotation = MKPointAnnotation()

        if let location = sourcePlacemark.location {
            sourceAnnotation.coordinate = location.coordinate
        }

        let destinationAnnotation = MKPointAnnotation()

        if let location = destinationPlacemark.location {
            destinationAnnotation.coordinate = location.coordinate
        }

        self.showAnnotations([sourceAnnotation,destinationAnnotation], animated: true )

        let directionRequest = MKDirections.Request()
        directionRequest.source = sourceMapItem
        directionRequest.destination = destinationMapItem
        directionRequest.transportType = .automobile

        // Calculate the direction
        let directions = MKDirections(request: directionRequest)

        directions.calculate {
            (response, error) -> Void in

            guard let response = response else {
                if let error = error {
                    print("Error: \(error)")
                }

                return
            }

            let route = response.routes[0]

            self.addOverlay((route.polyline), level: MKOverlayLevel.aboveRoads)

            let rect = route.polyline.boundingMapRect
            self.setRegion(MKCoordinateRegion(rect), animated: true)
        }
    }
}


extension CLLocationCoordinate2D {
    init(location: Position) {
        self.init()
        self.latitude = location.latitude
        self.longitude = location.longitude
    }
}
