//
//  File.swift
//  
//
//  Created by 吉川創麻 on 2024/07/06.
//

import Foundation

public enum TimeOfDay {
    case morning
    case afternoon
    case night
    case midnight
}

public func getTimeOfDay() -> TimeOfDay {
    // 日本のタイムゾーンを設定
    let timeZoneJST = TimeZone(identifier: "Asia/Tokyo")!
    
    // 現在日時を取得
    let now = Date()
    
    // カレンダーを日本のタイムゾーンに設定
    var calendar = Calendar.current
    calendar.timeZone = timeZoneJST
    
    // 現在の時間を取得
    let hour = calendar.component(.hour, from: now)
    
    if hour >= 6 && hour < 9 {
        return TimeOfDay.morning
    } else if hour >= 9 && hour < 18 {
        return TimeOfDay.afternoon
    } else if hour >= 18 && hour < 22 {
        return TimeOfDay.night
    } else if hour >= 22 || hour < 6 {
        return TimeOfDay.midnight
    } else {
        return TimeOfDay.afternoon
    }
}
