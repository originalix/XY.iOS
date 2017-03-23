//
//  GlobalConst.swift
//  xy.ios
//
//  Created by Lix on 17/3/23.
//  Copyright © 2017年 Lix. All rights reserved.
//

import UIKit

class GlobalConst: NSObject {
    static let APP_SECRET = "BhHXD4/ygUzU8DwEqd81KLCbp5vc855AME2OPaRUkqI="
    
    /*API*/
    static let API_BASE_URL = "http://119.29.183.197" //Base URL
    static let API_TEST_URL = "http://local.lix.com/running/public" //Base URL
    
    /*Users*/
    static let API_AUTH_URL = "/api/test"
    static let API_REGISTER_URL = "/api/register"

    static func url(path: String) -> String {
        return API_BASE_URL + path
    }
    
    static func testUrl(path: String) -> String {
        return API_TEST_URL + path
    }
    
    static let appdelegate = UIApplication.shared.delegate as! AppDelegate
}
