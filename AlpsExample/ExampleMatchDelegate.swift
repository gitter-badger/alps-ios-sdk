//
//  ExampleMatchDelegate.swift
//  AlpsExample
//
//  Created by Maciej Burda on 21/02/2018.
//  Copyright © 2018 Alps. All rights reserved.
//

import Foundation
import AlpsSDK

class ExampleMatchHandler: MatchDelegate {
    var onMatch: OnMatchClosure?
    init(_ onMatch: @escaping OnMatchClosure) {
        self.onMatch = onMatch
    }
}
