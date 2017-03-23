//
//  HttpClient.swift
//  SGHome
//
//  Created by Lix on 17/2/15.
//  Copyright © 2017年 State Grid. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import CryptoSwift

class HttpClient {
    
    static func get(url: URLConvertible, successCallback: ((_ json: JSON) -> Void)!) {
        call(method: HTTPMethod.get, url: url, params: nil, needTip:true, successCallback: successCallback, errorCallback: nil)
    }
    
    static func get(url: URLConvertible, params: [String: AnyObject]?, successCallback: ((_ json: JSON) -> Void)!) {
        call(method: HTTPMethod.get, url: url, params: params, needTip:true, successCallback: successCallback, errorCallback: nil)
    }
    
    static func get(url: URLConvertible, params: [String: AnyObject]?, successCallback: ((_ json: JSON) -> Void)!, errorCallback: ((_ code: Int, _ msg: String) -> Void)!) {
        call(method: HTTPMethod.get, url: url, params: params, needTip:true, successCallback: successCallback, errorCallback: errorCallback)
    }
    
    static func get(url: URLConvertible, params: [String: AnyObject]?, needTip: Bool, successCallback: ((_ json: JSON) -> Void)!, errorCallback: ((_ code: Int, _ msg: String) -> Void)!) {
        call(method: HTTPMethod.get, url: url, params: params, needTip: needTip, successCallback: successCallback, errorCallback: errorCallback)
    }
    
    static func post(url: URLConvertible, successCallback: ((_
        json: JSON) -> Void)!) {
        call(method: HTTPMethod.post, url: url, params: nil, needTip:true, successCallback: successCallback, errorCallback: nil)
    }
    
    static func post(url: URLConvertible, successCallback: ((_ json: JSON) -> Void)!, errorCallback: ((_ code: Int, _ msg: String) -> Void)!) {
        call(method: HTTPMethod.post, url: url, params: nil, needTip:true, successCallback: successCallback, errorCallback: nil)
    }
    
    static func post(url: URLConvertible, params: [String: AnyObject]?, successCallback: ((_ json: JSON) -> Void)!) {
        call(method: HTTPMethod.post, url: url, params: params, needTip:true, successCallback: successCallback, errorCallback: nil)
    }
    
    static func post(url: URLConvertible, params: [String: AnyObject]?, successCallback: ((_ json: JSON) -> Void)!, errorCallback: ((_ code: Int, _ msg: String) -> Void)!) {
        call(method: HTTPMethod.post, url: url, params: params, needTip:true, successCallback: successCallback, errorCallback: errorCallback)
    }
    
    static func post(url: URLConvertible, params: [String: AnyObject]?, needTip: Bool, successCallback: ((_ json: JSON) -> Void)!, errorCallback: ((_ code: Int, _ msg: String) -> Void)!) {
        call(method: HTTPMethod.post, url: url, params: params, needTip: needTip, successCallback: successCallback, errorCallback: errorCallback)
    }
    
    static func put(url: URLConvertible, params: [String: AnyObject]?, successCallback: ((_ json: JSON) -> Void)!, errorCallback: ((_ code: Int, _ msg: String) -> Void)!) {
        call(method: HTTPMethod.put, url: url, params: params, needTip:true, successCallback: successCallback, errorCallback: errorCallback)
    }
    
    static func call(method: HTTPMethod, url: URLConvertible, successCallback: ((_ json: JSON) -> Void)!) {
        call(method: method, url: url, params: nil, needTip:true, successCallback: successCallback, errorCallback: nil)
    }
    
    static func call(method: HTTPMethod, url: URLConvertible, successCallback: ((_ json: JSON) -> Void)!, errorCallback: ((_ code: Int, _ msg: String) -> Void)!) {
        call(method: method, url: url, params: nil, needTip:true, successCallback: successCallback, errorCallback: errorCallback)
    }
    
    static func call(method: HTTPMethod, url: URLConvertible, params: [String: AnyObject]?, needTip:Bool!, successCallback: ((_ json: JSON) -> Void)!, errorCallback: ((_ code: Int, _ msg: String) -> Void)!) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        let headers = hashHeader(url)
        Alamofire.request(url, method: method, parameters: params, headers: headers).responseJSON { (response) in
            self.callback(result: response.result.value as AnyObject!, needTip:needTip, successCallback: successCallback, errorCallback: errorCallback)
        }
    }
    
    class func hashHeader(_ url: URLConvertible) -> HTTPHeaders {
        let appSecret = GlobalConst.APP_SECRET
        let timestamp = Int(Date().timeIntervalSince1970 * 1)
        let device = Utility.uuid()
        
        let auth = (appSecret + "\(timestamp)" + device + "\(url)").sha256()
        let headers: HTTPHeaders = [
            "APP" : "app",
            "Timestamp" : String(timestamp),
            "Device" : device,
            "Auth" : auth
        ];
        return headers
    }
    
    class func uploadImage(_ imageDics:[String:UIImage], _ url: URLConvertible, scale: CGFloat, _ method: HTTPMethod, params: [String: AnyObject]?, successCallback: ((_ json: JSON) -> Void)!, errorCallback: ((_ code: Int, _ msg: String) -> Void)!) {
        
        Alamofire.upload(multipartFormData: { (multipartFormData) in
            for (key,image) in imageDics {
                if let data = UIImageJPEGRepresentation(image, scale) {
                    let imageName = "\(Date()).png"
                    multipartFormData.append(data, withName: key, fileName: imageName, mimeType: "image/png")
                }
            }
            
            if nil != params {
                for (key,value) in params! {
                    multipartFormData.append(value.data(using: String.Encoding.utf8.rawValue)!, withName: key)
                }
            }
        }, usingThreshold: SessionManager.multipartFormDataEncodingMemoryThreshold, to: url, method: method, headers: HttpClient.hashHeader(url)) { (encodingResult) in
            switch encodingResult {
            case .success(request: let upload, streamingFromDisk: _, streamFileURL: _):
                upload.responseJSON(completionHandler: { (response) in
                    self.callback(result: response.result.value as AnyObject!,needTip:true, successCallback: successCallback, errorCallback: errorCallback)
                })
            case .failure(let error):
                print(error)
            }
        }
    }

    static func callback(result: AnyObject!,needTip:Bool!,successCallback: ((_ json: JSON) -> Void)!, errorCallback: ((_ code: Int, _ msg: String) -> Void)!) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        var code: Int
        var msg: String
        
        if nil == result {
            code = 501
            msg = "服务器未响应"
            
            if nil != errorCallback {
                errorCallback(code, msg)
            }
            return
        }
        
        let data = JSON(result)
        if data == JSON.null {
            code = 501
            msg = "无法解析服务器响应"
            
            if nil != errorCallback {
                errorCallback(code, msg)
            }
            return
        }
        
        if(data["code"].int != 200){
        
            if nil != errorCallback {
                code = data["code"].int!
                msg = data["message"] != JSON.null ? data["message"].string! : "服务器未返回错误信息"
                if needTip == true {
                    XYToast.hiddenToast()
                    XYToast.show(msg, 1)
                }
                errorCallback(code, msg)
            }
            
            if data["code"].int == 402{

            }
            return
        }

        if JSON.null != data["credit"] {
        }
        
        if nil != successCallback {
            successCallback(data)
        }
    }
}
