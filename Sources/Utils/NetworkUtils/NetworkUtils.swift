//
//  File.swift
//  
//
//  Created by 吉川創麻 on 2024/06/30.
//

import Foundation
import Network
import AVFoundation

// デバイスがネットワークに接続できている場合、trueを返却する
// ネットワーク接続が必要な機能を呼び出す前に、当関数でネットワーク接続状態を確認する
public func isConnectedToNetwork() -> Bool {
    let monitor = NWPathMonitor()
    var isConnected = false
    let semaphore = DispatchSemaphore(value: 0)

    monitor.pathUpdateHandler = { path in
        if path.status == .satisfied {
            isConnected = true
        } else {
            isConnected = false
        }
        semaphore.signal()
    }
    let queue = DispatchQueue(label: "NetworkMonitor")
    monitor.start(queue: queue)
    
    semaphore.wait() // 状態更新を待つ
    monitor.cancel()
    return isConnected
}
