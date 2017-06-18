//
//  TimeFormate.swift
//  BoardGameForest
//
//  Created by Finn on 2017/6/18.
//  Copyright © 2017年 Finn. All rights reserved.
//

import UIKit

class TimeFormate: NSObject {

    func getTodayTimeStamp() -> TimeInterval {
        let comp: DateComponents = Calendar.current.dateComponents([.year, .month, .day], from: Date())
        let startOfDay = Calendar.current.date(from: comp)!
        
        return startOfDay.timeIntervalSince1970
    }
    
    func getPrettyTime(timeStamp: TimeInterval) -> String {
        let inFormatter = DateFormatter()
        inFormatter.locale = NSLocale(localeIdentifier: "zh_TW") as Locale!
        inFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        return inFormatter.string(from: Date(timeIntervalSince1970: timeStamp/1000))
    }
}
