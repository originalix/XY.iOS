//
//  MyFancyMenuViewController.swift
//  XY.iOS
//
//  Created by Lix on 2017/8/14.
//  Copyright © 2017年 Lix. All rights reserved.
//

import UIKit
import SideMenu

let Identifier: String = "TABLEVIEW_CELL"

class MyFancyMenuViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

extension MyFancyMenuViewController: Menu {
    var menuItems: [UIView] {
        return tableView.visibleCells
    }
}

extension MyFancyMenuViewController: UITableViewDelegate, UITableViewDataSource {
    func registerTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: Identifier)
    
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Identifier)
        return cell!
    }
}
