//
//  Feature.swift
//  MaccabiFramework
//
//  Created by Bracha Yalon on 31/05/2021.
//  Copyright © 2021 Tami yallon. All rights reserved.
//

import Foundation
import MapKit

public struct Route {
    
    public static let shared = Route()
    
    public func createPath(sourcePlaceMark : MKPlacemark, destinationPlaceMark : MKPlacemark, completion: @escaping (MKRoute?) -> Void) {
        
        let sourceMapItem = MKMapItem(placemark: sourcePlaceMark)
        let destinationItem = MKMapItem(placemark: destinationPlaceMark)
        
        let directionRequest = MKDirections.Request()
        directionRequest.source = sourceMapItem
        directionRequest.destination = destinationItem
        directionRequest.transportType = .automobile
        
        let direction = MKDirections(request: directionRequest)
        
        
        direction.calculate { (response, error) in
            guard let response = response else {
                if let error = error {
                    print("ERROR FOUND : \(error.localizedDescription)")
                }
                completion (nil)
                return
            }
            
            let route = response.routes[0]
            
            completion (route)
        }
    }
}

