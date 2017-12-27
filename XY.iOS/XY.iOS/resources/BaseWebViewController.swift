//
//  BaseWebViewController.swift
//  Hybrid
//
//  Created by Lix on 2017/6/22.
//  Copyright © 2017年 Lix. All rights reserved.
//

import UIKit
import WebKit
import SCLAlertView

class BaseWebViewController: UIViewController, WKNavigationDelegate, WKUIDelegate, WKScriptMessageHandler {

    //MARK: - property
    public var url: String!
    public var webView: WKWebView!
    public var progressView: UIProgressView!
    public let URL_SCHEME = "test"
    private var isNeedCache: Bool!

    //MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initialzeWebView()
        layoutNavi()
        setNeedCache(false)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        requestData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    deinit {
        webView.removeObserver(self, forKeyPath: "estimatedProgress")
    }
    
    //MARK: - Load and Clean Cache
    func requestData() {
        if getNeedCache() {
            webView.load(URLRequest.init(url: URL.init(string: url)!, cachePolicy: .returnCacheDataElseLoad, timeoutInterval: 10))
        } else {
            webView.load(URLRequest.init(url: URL.init(string: url)!, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10))
        }
        //有网络的情况
//        if false {
//            refresh()
//        }
    }
    
    func cleanCache() {
        if #available(iOS 9.0, *) {
            let set = Set.init(arrayLiteral:
                WKWebsiteDataTypeDiskCache,
                               WKWebsiteDataTypeOfflineWebApplicationCache,
                               WKWebsiteDataTypeMemoryCache,
                               WKWebsiteDataTypeLocalStorage,
                               WKWebsiteDataTypeCookies,
                               WKWebsiteDataTypeSessionStorage,
                               WKWebsiteDataTypeIndexedDBDatabases,
                               WKWebsiteDataTypeWebSQLDatabases
            )
            
            let dateFrom = Date.init(timeIntervalSince1970: 0)
            WKWebsiteDataStore.default().removeData(ofTypes: set, modifiedSince: dateFrom, completionHandler: {
                print("清除web缓存成功")
            })
        } else {
        }
    }
    
    func refresh() {
        if true {
            cleanCache()
            webView.reload()
        }
    }
    
    //MARK: - initialize
    public func initialzeWebView() {
        let userContentController = WKUserContentController()
        userContentController.add(self, name: "appBridge")
        let config = WKWebViewConfiguration()
        config.userContentController = userContentController
        
        let height = getWebViewHeight()
        webView = WKWebView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: height), configuration: config)
        webView.addObserver(self, forKeyPath: "estimatedProgress", options: .new, context: nil)
        webView.navigationDelegate = self
        webView.uiDelegate = self
        self.view.addSubview(webView)
        
        initializeProgressView()
    }
    
    private func getWebViewHeight() -> CGFloat {
        var height = self.view.bounds.size.height
        if self.tabBarController != nil {
            height -= (self.tabBarController?.tabBar.frame.height)!
        }
        if !(self.navigationController?.navigationBar.isTranslucent)! {
            height -= 64
        }
        
        return height
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if (keyPath == "estimatedProgress") {
            progressView.progress = Float(webView.estimatedProgress)
            if progressView.progress == 1 {
                UIView.animate(withDuration: 0.25, delay: 0.3, options: .curveEaseOut, animations: { 
                    self.progressView.transform = CGAffineTransform.init(scaleX: 1, y: 1.4)
                }, completion: { (finished) in
                    self.progressView.isHidden = true
                })
            }
        } else {
            super.observeValue(forKeyPath: keyPath, of: object, change: change, context: context)
        }
    }
    
    public func initializeProgressView() {
        progressView = UIProgressView(frame: CGRect(x: 0, y: 65, width: self.view.bounds.width, height: 10))
        progressView.transform = CGAffineTransform.init(scaleX: 1, y: 1.5)
        self.view.addSubview(progressView)
    }
    
    public func layoutNavi() {
        let rightBar = UIBarButtonItem.init(title: "刷新", style: .plain, target: self, action: #selector(BaseWebViewController.refresh))
        self.navigationItem.rightBarButtonItem = rightBar
        let leftBar = UIBarButtonItem.init(title: "清除", style: .plain, target: self, action: #selector(BaseWebViewController.cleanCache))
        self.navigationItem.leftBarButtonItem = leftBar
    }
    
    public func setNeedCache(_ isNeedCache: Bool) {
        self.isNeedCache = isNeedCache
    }
    
    public func getNeedCache() -> Bool {
        return self.isNeedCache
    }
    
    //MARK: - WKWebView WKNavigationDelegate
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        print("开始加载网页")
        progressView.isHidden = false
        progressView.transform = CGAffineTransform.init(scaleX: 1, y: 1.5)
        self.view.bringSubview(toFront: progressView)
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("加载完成")
        progressView.isHidden = true
        getPageTitle(webView)
        let jsStr = "this.msg = 'helllllll';"
        webView.evaluateJavaScript(jsStr) { (id, error) in
            if (id != nil) {
                print(id!)
            }
        }
    }
    
    func getPageTitle(_ webView: WKWebView) {
        webView.evaluateJavaScript("document.title") { (value, error) in
            if let title = value {
                if !((title as! String).isEmpty) {
                    self.navigationItem.title = (title as! String)
                }
            }
        }
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        decisionHandler(.allow)
    }
    
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        print("加载失败")
        handleError(error: error as NSError)
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        handleError(error: error as NSError)
    }
    
    func handleError(error: NSError) {
        let failureUrl = error.userInfo["NSErrorFailingURLStringKey"] as? String
        if (failureUrl != nil) {
            if let url = URL.init(string: failureUrl!) {
                if url.scheme != URL_SCHEME {
                    //不符合的操作
                    return
                }
                if (failureUrl?.hasPrefix("test://tel"))! {
                    callPhoneNumber(failingUrl: failureUrl)
                    return
                }

                let didOpen = UIApplication.shared.openURL(url)
                if didOpen {
                    print("open url success")
                }

                return
            }
        }
    }
    
    func callPhoneNumber(failingUrl: String?) {
        let index = failingUrl?.index((failingUrl?.startIndex)!, offsetBy: 10)
        let telURL =  failingUrl?.substring(from: index!)
        let phoneNumber = "telprompt://\(telURL!)"
        
        let didOpen = UIApplication.shared.openURL(URL(string: phoneNumber)!)
        if didOpen {
            print("open url success")
        }
    }
    
    //MARK: - WKUIDelegate
    func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Void) {
        SCLAlertView().showTitle(
            "\t",
            subTitle: message + "\n",
            duration: 0,
            completeText: "确定",
            style: .success,
            colorStyle: 0xFF8000,
            colorTextButton: 0xffffff
            ).setDismissBlock {
                completionHandler();
        }
    }
    
    func webView(_ webView: WKWebView, runJavaScriptConfirmPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (Bool) -> Void) {
        let alertController = UIAlertController(title: "提示", message: message, preferredStyle: .alert)
        
        alertController.addAction(UIAlertAction(title: "取消", style: .destructive, handler: { (action) in
            completionHandler(false)
        }))
        
        alertController.addAction(UIAlertAction(title: "确定", style: .default, handler: { (action) in
            completionHandler(true)
        }))
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        print(message.name)
    }
    
    func webView(_ webView: WKWebView, runJavaScriptTextInputPanelWithPrompt prompt: String, defaultText: String?, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (String?) -> Void) {
        let alertController = UIAlertController(title: "请输入", message: prompt, preferredStyle: .alert)
        
        alertController.addTextField { (textField) in
            textField.placeholder = defaultText
        }
        
        alertController.addAction(UIAlertAction(title: "确定", style: .default, handler: { (action) in
            let textField = alertController.textFields?.first
            completionHandler(textField?.text)
        }))
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    // 通过JSON传过来
//    - (void)callWithDict:(NSDictionary *)params;
    func sendJSON(dic: Dictionary<String, Any>) {
        print(dic)
    }
}
