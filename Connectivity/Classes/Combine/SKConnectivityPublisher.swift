//
//  ConnectivityPublisher.swift
//  Connectivity
//
//  Created by Ross Butler on 05/05/2020.
//

#if canImport(Combine)

import Combine
import Foundation

@available(OSX 10.15, iOS 13.0, tvOS 13.0, *)
public struct SKConnectivityPublisher: Publisher {
    public typealias Output = SKConnectivity
    public typealias Failure = Never
    private let configuration: SKConnectivityConfiguration
    
    public init(configuration: SKConnectivityConfiguration = SKConnectivityConfiguration()) {
        self.configuration = configuration
    }
    
    public func receive<S: Subscriber>(subscriber: S)
        where SKConnectivityPublisher.Failure == S.Failure, SKConnectivityPublisher.Output == S.Input {
            let subscription = ConnectivitySubscription(configuration: configuration, subscriber: subscriber)
        subscriber.receive(subscription: subscription)
    }
}

#endif
