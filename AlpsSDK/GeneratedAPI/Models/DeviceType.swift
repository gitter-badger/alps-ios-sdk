//
// DeviceType.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation

/** A device might be either virtual like a pin device or physical like a mobile phone or iBeacon device.  */
public enum DeviceType: String {
    case mobileDevice = "MobileDevice"
    case pinDevice = "PinDevice"
    case ibeacondevice = "IBeaconDevice"

    func encodeToJSON() -> Any { return rawValue }
}
