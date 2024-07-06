//
//  File.swift
//  
//
//  Created by 吉川創麻 on 2024/07/06.
//

import Foundation

public func checkIsFirstLaunch() -> Bool {
    let userDefaults = UserDefaults.standard
    
    // key: hasLaunchedBefore の値がfalseの場合trueを返却する
    if !userDefaults.bool(forKey: "hasLaunchedBefore") {
        // フラグをtrueに設定して、次回の起動ではこのブロックが実行されないようにします。
        //userDefaults.set(true, forKey: "hasLaunchedBefore")
        return true
    // key: hasLaunchedBefore の値がtrueの場合falseを返却する
    } else {
        return false
    }
}

public func setIsFirstLaunchTrue() {
    UserDefaults.standard.set(true, forKey: "hasLaunchedBefore")
}
