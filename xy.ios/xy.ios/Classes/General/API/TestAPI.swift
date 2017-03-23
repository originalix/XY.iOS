//
//  TestAPI.swift
//  xy.ios
//
//  Created by Lix on 17/3/23.
//  Copyright © 2017年 Lix. All rights reserved.
//

import UIKit
import SwiftyJSON

class TestAPI: NSObject {
    func testAPI(success: @escaping ((JSON) -> Void), error: @escaping ((String) -> Void)) {
        let url = GlobalConst.url(path: GlobalConst.API_REGISTER_URL)
        let params = [
            "mobile" : "",
            "password" : ""
        ]
        HttpClient.call(method: .put, url: url, params: params as [String : AnyObject]?, needTip: true, successCallback: { (JSON) in
            success(JSON)
        }) { (code, msg) in
            error(msg)
        }
    }
}
