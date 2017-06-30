//
//  NetworkState.swift
//  HttpClient
//
//  Created by Lix on 2017/6/19.
//  Copyright © 2017年 Lix. All rights reserved.
//

import UIKit
import Reachability

public protocol NetworkStateProtocol {
    typealias NetworkConnected = () -> Void!
    typealias NetworkUnConnected = () -> Void!
    func isReachable() -> Bool
    func isReachableViaWiFi() -> Bool
    func observeNetwork(connected: @escaping NetworkConnected, unconnected: @escaping NetworkUnConnected)
}

public class NetworkState: NSObject, NetworkStateProtocol {
  
    var reach: Reachability?
    
    public typealias NetworkConnected = () -> Void!
    public typealias NetworkUnConnected = () -> Void!
    
    public static let share = NetworkState()
    
    private override init() {}
    
    public func isReachable() -> Bool {
        return (self.reach?.isReachable())!
    }
    
    public func isReachableViaWiFi() -> Bool {
        return (self.reach?.isReachableViaWiFi())!
    }
    
    public func observeNetwork(connected: @escaping NetworkConnected, unconnected: @escaping NetworkUnConnected) {
        self.reach = Reachability.forInternetConnection()
        
        self.reach?.reachableBlock = {
            (reach: Reachability?) -> Void in
            connected()
        }
        
        self.reach?.unreachableBlock = {
            (reach: Reachability?) -> Void in
            unconnected()
        }
        
        self.reach?.startNotifier()
    }
}
