//
//  File.swift
//  
//
//  Created by 吉川創麻 on 2024/07/06.
//

import Foundation

let key_isFastLaunch = "hasLaunchedBefore"

public class AppLifeCycleManager {
    
    private var isFirstLaunch = UserDefaults.standard.bool(forKey: key_isFastLaunch)
    
    // 初回起動の場合、trueを返却
    // 初回起動でない場合、falseを返却
    public func getIsFirstLaunch() -> Bool {
        return !self.isFirstLaunch
    }
    
    public func setIsFirstLaunchTrue() {
        UserDefaults.standard.set(true, forKey: key_isFastLaunch)
    }

}
