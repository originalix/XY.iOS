//
//  Utility.swift
//  SGHome
//
//  Created by Lix on 17/2/15.
//  Copyright © 2017年 State Grid. All rights reserved.
//

import UIKit

class Utility: NSObject {
    //获得屏幕scale：iPhone5和iPhone6是2，iPhone6Plus是3
    static func getScreenScale()->Int{
        return Int(UIScreen.main.scale)
    }
    
    class func getLocalDateFormateUTCDate(UTCdtstring:String)->String{
        let dateFormatter = DateFormatter()
        //输入格式
        dateFormatter.dateFormat="yyyy-MM-dd'T'HH:mm:ssZ"
        let localTimeZone=NSTimeZone.local
        dateFormatter.timeZone=localTimeZone
        let dateFormatted=dateFormatter.date(from: UTCdtstring)
        //输出格式
        dateFormatter.dateFormat="yyyy-MM-dd HH:mm"
        let dateString=dateFormatter.string(from: dateFormatted!)
        return dateString
    }
    
    class func getDate(str: String) -> Date! {
        if str.isEmpty || "" == str {
            return nil
        }
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZ"
        return df.date(from: str)
    }
    
    class func uuid() -> String {
        let userDefault = UserDefaults.standard
        
        var uuid:String! = userDefault.string(forKey: "uuid")
        if nil == uuid || uuid == "" {
            uuid = NSUUID().uuidString
            userDefault.setValue(uuid, forKey: "uuid")
        }
        
        return uuid;
    }

    // Helper function to convert from RGB to UIColor
    class func UIColorFromRGB(_ rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
}
