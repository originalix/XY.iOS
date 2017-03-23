//
//  ViewController.swift
//  xy.ios
//
//  Created by Lix on 17/3/23.
//  Copyright © 2017年 Lix. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        TestAPI().testAPI(success: { (json) in
            print(json)
        }) { (msg) in
            print(msg)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

