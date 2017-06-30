//
//  HttpClient.swift
//  HttpClient
//
//  Created by Lix on 2017/6/14.
//  Copyright © 2017年 Lix. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

public protocol RequestProtocol {
    
    /// 请求成功回调
    typealias SuccessCallback = (_ json: JSON) -> Void!
    
    /// 请求失败的回调
    typealias ErrorCallback = (_ code: Int, _ msg: String) -> Void!
    
    /// 请求方法
    var method: HTTPMethod {get set}
    
    /// 请求URL
    var url: String {get set}
    
    /// 请求参数
    var params: [String: AnyObject]! {get set}
    
    /// Get Request API
    ///
    /// - Parameters:
    ///   - successCallback: Closure
    ///   - errorCallback: Closure
    func get(successCallback: @escaping SuccessCallback, errorCallback: @escaping ErrorCallback)
    
    /// Post Request API
    ///
    /// - Parameters:
    ///   - successCallback: Closure
    ///   - errorCallback: Closure
    func post(successCallback: @escaping SuccessCallback, errorCallback: @escaping ErrorCallback)
    
    /// Put Request API
    ///
    /// - Parameters:
    ///   - successCallback: Closure
    ///   - errorCallback: Closure
    func put(successCallback: @escaping SuccessCallback, errorCallback: @escaping ErrorCallback)
    
    /// Delete Request API
    ///
    /// - Parameters:
    ///   - successCallback: Closure
    ///   - errorCallback: Closure
    func delete(successCallback: @escaping SuccessCallback, errorCallback: @escaping ErrorCallback)
    
    /// 上传图片API
    ///
    /// - Parameters:
    ///   - imageDics: [String: UIImage] 存放图片的键值集合
    ///   - scale: 图片压缩比例
    ///   - successCallback: Closure
    ///   - errorCallback: Closure
    func uploadImage(imageDics: [String: UIImage], scale: CGFloat, successCallback: @escaping SuccessCallback, errorCallback: @escaping ErrorCallback)
}

public class HttpClient: NSObject, RequestProtocol {
    public typealias SuccessCallback = (_ json: JSON) -> Void!
    public typealias ErrorCallback = (_ code: Int, _ msg: String) -> Void!
    
    public var method: HTTPMethod
    public var url: String
    public var params: [String : AnyObject]!
    
    public init(method: HTTPMethod, url: String, params: [String : AnyObject]!) {
        self.method = method
        self.url = url
        self.params = params
    }
    
    public func get(successCallback: @escaping RequestProtocol.SuccessCallback, errorCallback: @escaping RequestProtocol.ErrorCallback) {
        call(successCallback: successCallback, errorCallback: errorCallback)
    }
    
    public func post(successCallback: @escaping RequestProtocol.SuccessCallback, errorCallback: @escaping RequestProtocol.ErrorCallback) {
        call(successCallback: successCallback, errorCallback: errorCallback)
    }
    
    public func put(successCallback: @escaping RequestProtocol.SuccessCallback, errorCallback: @escaping RequestProtocol.ErrorCallback) {
        call(successCallback: successCallback, errorCallback: errorCallback)
    }
    
    public func delete(successCallback: @escaping RequestProtocol.SuccessCallback, errorCallback: @escaping RequestProtocol.ErrorCallback) {
        call(successCallback: successCallback, errorCallback: errorCallback)
    }
    
    public static func hashHeader() -> HTTPHeaders {
        let headers: HTTPHeaders = [ "APP" : "LNTS-Foundation"]
        return headers
    }
    
    func call(successCallback: @escaping SuccessCallback, errorCallback: @escaping ErrorCallback) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        let headers = HttpClient.hashHeader()
        Alamofire.request(url, method: method, parameters: params, headers: headers).responseJSON { (response) in
            self.callback(result: response.result.value as AnyObject!, successCallback: successCallback, errorCallback: errorCallback)
        }
    }
    
    public func callback(result: AnyObject!, successCallback: SuccessCallback, errorCallback: ErrorCallback) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
    
    public func uploadImage(imageDics: [String: UIImage], scale: CGFloat, successCallback: @escaping SuccessCallback, errorCallback: @escaping ErrorCallback) {
        Alamofire.upload(multipartFormData: { (multipartFormData) in
            for (key, image) in imageDics {
                if let data = UIImageJPEGRepresentation(image, scale) {
                    let imageName = "\(Date()).png"
                    multipartFormData.append(data, withName: key, fileName: imageName, mimeType: "image/png")
                }
            }
            
            if (self.params != nil) {
                for (key, value) in self.params! {
                    multipartFormData.append(value.data(using: String.Encoding.utf8.rawValue)!, withName: key)
                }
            }
            
        }, usingThreshold: SessionManager.multipartFormDataEncodingMemoryThreshold, to: self.url, method: self.method, headers: HttpClient.hashHeader()) { (encodingResult) in
            
            switch encodingResult {
                
            case .success(request: let upload, streamingFromDisk: _, streamFileURL: _):
                upload.responseJSON(completionHandler: { (response) in
                    self.callback(result: response.result.value as AnyObject!, successCallback: successCallback, errorCallback: errorCallback)
                })
                
            case .failure(let error):
                print(error)
            }
        }
    }
}
