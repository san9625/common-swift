//
//  File.swift
//  
//
//  Created by 吉川創麻 on 2024/07/06.
//

import Foundation

public class TimerManager {
    
    private var timer: Timer?
    private var remainingTime: Int = 0
    private var duration: Int

    public init(duration: Int) {
        self.duration = duration
    }

    public func startTimer(completion: @escaping () -> Void) {
        
        remainingTime = duration
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            guard let self = self else { return }

            if self.remainingTime > 0 {
                self.remainingTime -= 1
            } else {
                self.timer?.invalidate()
                self.timer = nil
                // クロージャの処理を実行
                completion()
            }
        }
    }

    public func stopTimer() {
        timer?.invalidate()
        timer = nil
    }

    deinit {
        stopTimer()
    }
}
