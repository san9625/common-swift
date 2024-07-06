//
//  File.swift
//  
//
//  Created by 吉川創麻 on 2024/07/06.
//

import AVFoundation

public class AudioSetting {
    
    public static let shared = AudioSetting()
    private init() {}
    
    public static var flagAudioSetting = 0
    
    public func setupAudioSessionForSpeaker(completion: ((Error?) -> Void)? = nil) {
        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setCategory(.playAndRecord, mode: .default, options: [.defaultToSpeaker])
            try audioSession.setActive(true)
            Self.flagAudioSetting = 1
            completion?(nil)  // 成功時、エラーなしでコールバックを呼び出す（存在する場合）
        } catch {
            print("オーディオセッション設定エラー: \(error)")
            completion?(error)  // 失敗時、エラー情報をコールバックに渡す（存在する場合）
        }
    }

    public func turnOffSpeaker(completion: ((Error?) -> Void)? = nil) {
        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setCategory(.playAndRecord, mode: .default)
            try audioSession.setActive(true)
            Self.flagAudioSetting = 0
            completion?(nil)  // 成功時、エラーなしでコールバックを呼び出す（存在する場合）
        } catch {
            print("オーディオセッション設定エラー: \(error)")
            completion?(error)  // 失敗時、エラー情報をコールバックに渡す（存在する場合）
        }
    }
    
}
