//
//  TestWebViewController.swift
//  XY.iOS
//
//  Created by Lix on 2017/12/27.
//  Copyright © 2017年 Lix. All rights reserved.
//

import UIKit

class TestWebViewController: BaseWebViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        let path = Bundle.main.bundlePath
//        let baseurl = URL.init(fileURLWithPath: path)
//        let htmlPath = Bundle.main.path(forResource: "test", ofType: "html").
//        do {
//            let htmlCont = try String.init(contentsOfFile: htmlPath!, encoding: String.Encoding.utf8)
//            self.webView.loadHTMLString(htmlCont, baseURL: baseurl)
//        } catch {
//
//        }
        
        let url = URL.init(string: Bundle.main.path(forResource: "test", ofType: "html", inDirectory: "www")!)
        let request = URLRequest.init(url: url!)
        self.webView.load(request)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
