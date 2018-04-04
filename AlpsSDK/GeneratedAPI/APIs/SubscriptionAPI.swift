//
// SubscriptionAPI.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Alamofire
import Foundation

open class SubscriptionAPI: APIBase {
    /**
     Create a subscription for a device

     - parameter deviceId: (path) The id (UUID) of the device.
     - parameter subscription: (body) Subscription to create on a device.
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func createSubscription(deviceId: String, subscription: Subscription, completion: @escaping ((_ data: Subscription?, _ error: Error?) -> Void)) {
        createSubscriptionWithRequestBuilder(deviceId: deviceId, subscription: subscription).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }

    /**
     Create a subscription for a device
     - POST /devices/{deviceId}/subscriptions
     - examples: [{contentType=application/json, example={
     "duration" : 3.616076749251911,
     "createdAt" : 0,
     "worldId" : "aeiou",
     "matchTTL" : 2.027123023002322,
     "topic" : "aeiou",
     "range" : 9.301444243932576,
     "location" : {
     "createdAt" : 6,
     "altitude" : 5.637376656633329,
     "verticalAccuracy" : 7.061401241503109,
     "latitude" : 1.4658129805029452,
     "horizontalAccuracy" : 2.3021358869347655,
     "longitude" : 5.962133916683182
     },
     "selector" : "aeiou",
     "pushers" : [ "aeiou" ],
     "id" : "aeiou",
     "deviceId" : "aeiou"
     }}]

     - parameter deviceId: (path) The id (UUID) of the device.
     - parameter subscription: (body) Subscription to create on a device.

     - returns: RequestBuilder<Subscription>
     */
    open class func createSubscriptionWithRequestBuilder(deviceId: String, subscription: Subscription) -> RequestBuilder<Subscription> {
        var path = "/devices/{deviceId}/subscriptions"
        path = path.replacingOccurrences(of: "{deviceId}", with: "\(deviceId)", options: .literal, range: nil)
        let URLString = AlpsAPI.basePath + path
        let parameters = subscription.encodeToJSON() as? [String: AnyObject]

        let url = NSURLComponents(string: URLString)

        let requestBuilder: RequestBuilder<Subscription>.Type = AlpsAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true)
    }

    /**
     Delete a Subscription

     - parameter deviceId: (path) The id (UUID) of the device.
     - parameter subscriptionId: (path) The id (UUID) of the subscription.
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func deleteSubscription(deviceId: String, subscriptionId: String, completion: @escaping ((_ error: Error?) -> Void)) {
        deleteSubscriptionWithRequestBuilder(deviceId: deviceId, subscriptionId: subscriptionId).execute { (_, error) -> Void in
            completion(error)
        }
    }

    /**
     Delete a Subscription
     - DELETE /devices/{deviceId}/subscriptions/{subscriptionId}
     -

     - parameter deviceId: (path) The id (UUID) of the device.
     - parameter subscriptionId: (path) The id (UUID) of the subscription.

     - returns: RequestBuilder<Void>
     */
    open class func deleteSubscriptionWithRequestBuilder(deviceId: String, subscriptionId: String) -> RequestBuilder<Void> {
        var path = "/devices/{deviceId}/subscriptions/{subscriptionId}"
        path = path.replacingOccurrences(of: "{deviceId}", with: "\(deviceId)", options: .literal, range: nil)
        path = path.replacingOccurrences(of: "{subscriptionId}", with: "\(subscriptionId)", options: .literal, range: nil)
        let URLString = AlpsAPI.basePath + path
        let parameters: [String: Any]? = nil

        let url = NSURLComponents(string: URLString)

        let requestBuilder: RequestBuilder<Void>.Type = AlpsAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "DELETE", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     Info about a subscription on a device

     - parameter deviceId: (path) The id (UUID) of the device.
     - parameter subscriptionId: (path) The id (UUID) of the subscription.
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getSubscription(deviceId: String, subscriptionId: String, completion: @escaping ((_ data: Subscription?, _ error: Error?) -> Void)) {
        getSubscriptionWithRequestBuilder(deviceId: deviceId, subscriptionId: subscriptionId).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }

    /**
     Info about a subscription on a device
     - GET /devices/{deviceId}/subscriptions/{subscriptionId}
     - examples: [{contentType=application/json, example={
     "duration" : 3.616076749251911,
     "createdAt" : 0,
     "worldId" : "aeiou",
     "matchTTL" : 2.027123023002322,
     "topic" : "aeiou",
     "range" : 9.301444243932576,
     "location" : {
     "createdAt" : 6,
     "altitude" : 5.637376656633329,
     "verticalAccuracy" : 7.061401241503109,
     "latitude" : 1.4658129805029452,
     "horizontalAccuracy" : 2.3021358869347655,
     "longitude" : 5.962133916683182
     },
     "selector" : "aeiou",
     "pushers" : [ "aeiou" ],
     "id" : "aeiou",
     "deviceId" : "aeiou"
     }}]

     - parameter deviceId: (path) The id (UUID) of the device.
     - parameter subscriptionId: (path) The id (UUID) of the subscription.

     - returns: RequestBuilder<Subscription>
     */
    open class func getSubscriptionWithRequestBuilder(deviceId: String, subscriptionId: String) -> RequestBuilder<Subscription> {
        var path = "/devices/{deviceId}/subscriptions/{subscriptionId}"
        path = path.replacingOccurrences(of: "{deviceId}", with: "\(deviceId)", options: .literal, range: nil)
        path = path.replacingOccurrences(of: "{subscriptionId}", with: "\(subscriptionId)", options: .literal, range: nil)
        let URLString = AlpsAPI.basePath + path
        let parameters: [String: Any]? = nil

        let url = NSURLComponents(string: URLString)

        let requestBuilder: RequestBuilder<Subscription>.Type = AlpsAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     Get all subscriptions for a device

     - parameter deviceId: (path) The id (UUID) of the device.
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getSubscriptions(deviceId: String, completion: @escaping ((_ data: Subscriptions?, _ error: Error?) -> Void)) {
        getSubscriptionsWithRequestBuilder(deviceId: deviceId).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }

    /**
     Get all subscriptions for a device
     - GET /devices/{deviceId}/subscriptions
     - examples: [{contentType=application/json, example=""}]

     - parameter deviceId: (path) The id (UUID) of the device.

     - returns: RequestBuilder<Subscriptions>
     */
    open class func getSubscriptionsWithRequestBuilder(deviceId: String) -> RequestBuilder<Subscriptions> {
        var path = "/devices/{deviceId}/subscriptions"
        path = path.replacingOccurrences(of: "{deviceId}", with: "\(deviceId)", options: .literal, range: nil)
        let URLString = AlpsAPI.basePath + path
        let parameters: [String: Any]? = nil

        let url = NSURLComponents(string: URLString)

        let requestBuilder: RequestBuilder<Subscriptions>.Type = AlpsAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }
}
