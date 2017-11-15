//
//  MatchMore+Location.swift
//  AlpsSDK
//
//  Created by Maciej Burda on 15/11/2017.
//  Copyright © 2017 Alps. All rights reserved.
//

import Foundation

public extension MatchMore {
    public class func startUpdatingLocation() {
        MatchMore.manager.contextManager.locationManager.startUpdatingLocation()
    }
    
    public class func stopUpdatingLocation() {
        MatchMore.manager.contextManager.locationManager.stopUpdatingLocation()
    }
    
    public class func startRanging(forUuid: UUID, identifier: String) {
        MatchMore.manager.contextManager.startRanging(forUuid: forUuid, identifier: identifier)
    }
}