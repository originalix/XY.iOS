//
//  XYToast.swift
//  xy.ios
//
//  Created by Lix on 17/3/23.
//  Copyright © 2017年 Lix. All rights reserved.
//

import UIKit
import Toaster

struct XYToast {
    public static func show(_ message: String) {
        toastMessage(message, 0, 1)
    }
    
    public static func show(_ message: String, _ duration: TimeInterval) {
        toastMessage(message, 0, duration)
    }
    
    public static func show(_ message: String, _ delay: TimeInterval, _ duration: TimeInterval) {
        toastMessage(message, delay, duration)
    }
    
    private static func toastMessage(_ message: String, _ delay: TimeInterval, _ duration: TimeInterval) {
        ToastView.appearance().font = UIFont.systemFont(ofSize: 18)
        ToastView.appearance().textColor = UIColor(white: 0.8, alpha: 1)
        ToastView.appearance().bottomOffsetPortrait = 100
        ToastView.appearance().textInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        Toast(text: message, delay: delay, duration: duration).show()
    }
    
    public static func hiddenToast() {
        ToastCenter.default.cancelAll()
    }
}
