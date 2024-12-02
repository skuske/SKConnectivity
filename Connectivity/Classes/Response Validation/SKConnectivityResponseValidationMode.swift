//
//  ConnectivityResponseValidationMode.swift
//  Connectivity
//
//  Created by Ross Butler on 1/20/19.
//

import Foundation

@objc
public enum SKConnectivityResponseValidationMode: Int {
    case containsExpectedResponseString,
         equalsExpectedResponseString,
         matchesRegularExpression,
         custom
}
