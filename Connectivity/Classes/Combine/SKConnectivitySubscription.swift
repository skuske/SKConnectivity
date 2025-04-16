//
//  ConnectivitySubscription.swift
//  Connectivity
//
//  Created by Ross Butler on 05/05/2020.
//

#if canImport(Combine)

import Combine
import Foundation

@available(OSX 10.15, iOS 13.0, tvOS 13.0, *)
class SKConnectivitySubscription<S: Subscriber>: Subscription where S.Input == SKConnectivity, S.Failure == Never {
    private let SKconnectivity: SKConnectivity
    private var subscriber: S?

    init(configuration: SKConnectivityConfiguration, subscriber: S) {
        SKconnectivity = SKConnectivity(configuration: configuration)
        self.subscriber = subscriber
        startNotifier(with: subscriber)
    }

    func cancel() {
        stopNotifier()
    }

    func request(_: Subscribers.Demand) {}

    private func startNotifier(with subscriber: S) {
        let connectivityChanged: (SKConnectivity) -> Void = { connectivity in
            _ = subscriber.receive(connectivity)
        }
        SKconnectivity.whenConnected = connectivityChanged
        SKconnectivity.whenDisconnected = connectivityChanged
        SKconnectivity.startNotifier()
    }

    private func stopNotifier() {
        SKconnectivity.stopNotifier()
        subscriber = nil
    }
}

#endif
