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
    
    private var audioMode: audioMode = .mic
    
    public func getAudioMode() -> audioMode {
        return self.audioMode
    }
    
    public func setupAudioSessionForSpeaker(mode: AVAudioSession.Mode, completion: ((Error?) -> Void)? = nil) {
        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setCategory(.playAndRecord, mode: mode, options: [.defaultToSpeaker])
            try audioSession.setActive(true)
            self.audioMode = .speaker
            completion?(nil)  // 成功時、エラーなしでコールバックを呼び出す（存在する場合）
        } catch {
            print("オーディオセッション設定エラー: \(error)")
            completion?(error)  // 失敗時、エラー情報をコールバックに渡す（存在する場合）
        }
    }

    public func turnOffSpeaker(mode: AVAudioSession.Mode, completion: ((Error?) -> Void)? = nil) {
        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setCategory(.playAndRecord, mode: mode)
            try audioSession.setActive(true)
            self.audioMode = .mic
            completion?(nil)  // 成功時、エラーなしでコールバックを呼び出す（存在する場合）
        } catch {
            print("オーディオセッション設定エラー: \(error)")
            completion?(error)  // 失敗時、エラー情報をコールバックに渡す（存在する場合）
        }
    }
}

public enum audioMode {
    case mic
    case speaker
}
