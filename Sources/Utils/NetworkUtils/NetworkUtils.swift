//
//  File.swift
//  
//
//  Created by 吉川創麻 on 2024/06/30.
//

import Foundation
import Network
import AVFoundation

public class NetworkManager {
    
    public static let shared = NetworkManager()
    private init() {}
    
    // 現在のネットワーク状態を確認し、ネットワークに接続していればtrueを、接続していなければfalse返却する
    public func isConnectedToNetwork() -> Bool {
 
        let monitor = NWPathMonitor()
        let currentPath = monitor.currentPath
        
        if currentPath.status == .satisfied {
            return true
        } else {
            return false
        }
       
    }
    
    // ネットワーク接続の状態変化を監視する
//    public func isConnectedToNetwork(completion: @escaping (Bool) -> Void) {
//        
//        var isConnected = false
//        let semaphore = DispatchSemaphore(value: 0)
//        
//        let monitor = NWPathMonitor()
//        monitor.pathUpdateHandler = { path in
//            if path.status == .satisfied {
//                completion(true)
//            } else {
//                completion(false)
//            }
//            monitor.cancel() // 状態を確認したら監視を停止
//        }
//        
//        let queue = DispatchQueue(label: "NetworkMonitor")
//        monitor.start(queue: queue)
//    }
    
}
