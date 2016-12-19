/**
 * ScalpsManager
 */

import Foundation
import CoreLocation
import Scalps

class ScalpsManager: ScalpsSDK {
    let defaultHeaders = [
        // FIXME: pass both keys on ScalpsManager creation
        "dev-key": "7eef938a-c09d-11e6-bc43-b390d71c98d2",
        "app-key": "833ec460-c09d-11e6-9bb0-cfb02086c30d",
        "Content-Type": "application/json; charset=UTF-8",
        "Accept": "application/json",
        "user-agent": "\(UIDevice().systemName) \(UIDevice().systemVersion)",
    ]

    let headers: [String: String]

    // XXX: this has to come from a configuration
    // let scalpsEndpoint = "http://localhost:9000"

    // Put setup code here. This method is called before the invocation of each test method in t
    let apiKey: String
    let locationManager: LocationManager

    // FIXME: add the world id when it's there
    // var world: World
    var users: [User] = []
    var devices: [Device] = []
    var locations: [DeviceLocation] = []
    var publications: [Publication] = []
    var subscriptions: [Subscription] = []

    convenience init(apiKey: String) {
        self.init(apiKey: apiKey, clLocationManager: CLLocationManager())
    }

    init(apiKey: String, clLocationManager: CLLocationManager) {
        self.apiKey = apiKey
        self.locationManager = LocationManager(clLocationManager)
        headers = defaultHeaders.merged(with: ["api-key": apiKey])
        // ScalpsAPI.basePath = scalpsEndpoint
        ScalpsAPI.customHeaders = headers
    }

    internal func createUser(_ userName: String, completion: @escaping (_ user: User?) -> Void) {
        let userCompletion = completion
        // FIXME: add a version accepting the user name
        let userTemplate = User(name: userName)
        let _ = Scalps.UsersAPI.createUser(user: userTemplate, completion: {
            (user, error) -> Void in
            if let u = user {
              self.users.append(u)
            }
            userCompletion(user)
        })
    }

    func createDevice(_ device: Device, for user: User, completion: @escaping (_ device: Device?) -> Void) {
        let userCompletion = completion
        let _ = Scalps.UserAPI.createDevice(userId: user.userId!, device: device, completion: {
            (device, error) -> Void in
            if let d = device {
                self.devices.append(d)
            }
            userCompletion(device)
        })
    }

    func createPublication(_ publication: Publication, for user: User, on device: Device,
                           completion: @escaping (_ publication: Publication?) -> Void) {
        let userCompletion = completion
        let publicationTemplate = publication

        let _ = Scalps.DeviceAPI.createPublication(userId: user.userId!, deviceId: device.deviceId!,
                                                          publication: publicationTemplate) {
            (publication, error) -> Void in

            if let p = publication {
                self.publications.append(p)
            }
            userCompletion(publication)
        }
    }

    func createSubscription(_ subscription: Subscription, for user: User, on device: Device,
                            completion: @escaping (_ subscription: Subscription?) -> Void) {
        let userCompletion = completion
        let subscriptionTemplate = subscription

        let _ = Scalps.DeviceAPI.createSubscription(userId: user.userId!, deviceId: device.deviceId!,
                                                           subscription: subscriptionTemplate) {
            (subscription, error) -> Void in

            if let p = subscription {
                self.subscriptions.append(p)
            }
            userCompletion(subscription)
        }
    }

    func updateLocation(_ location: DeviceLocation, for user: User, on device: Device,
                        completion: @escaping (_ location: DeviceLocation?) -> Void) {
        let userCompletion = completion

        let _ = Scalps.DeviceAPI.createLocation(userId: user.userId!, deviceId: device.deviceId!,
                                                       location: location) {
            (location, error) -> Void in

            if let l = location {
                self.locations.append(l)
            }
            userCompletion(location)
        }
    }

    func startUpdatingLocation() {
        locationManager.startUpdatingLocation()
    }

    func stopUpdatingLocation() {
        locationManager.stopUpdatingLocation()
    }
}
