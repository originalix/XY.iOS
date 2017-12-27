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
        let path = Bundle.main.bundlePath
        let baseurl = URL.init(fileURLWithPath: path)
        let htmlPath = Bundle.main.path(forResource: "test", ofType: "html")
        do {
            let htmlCont = try String.init(contentsOfFile: htmlPath!, encoding: String.Encoding.utf8)
            self.webView.loadHTMLString(htmlCont, baseURL: baseurl)
        } catch {
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
