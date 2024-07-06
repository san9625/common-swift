//
//  File.swift
//  
//
//  Created by 吉川創麻 on 2024/07/06.
//

import Foundation
import AVFoundation

// マイクの利用を要求
public func requestMicrophoneAccess() {
    AVAudioSession.sharedInstance().requestRecordPermission { granted in
        if granted {
            // マイクへのアクセスが許可された
            print("マイクへのアクセスが許可されました。")
        } else {
            // ユーザーがマイクへのアクセスを拒否した
            print("マイクへのアクセスが拒否されました。")
        }
    }
}


