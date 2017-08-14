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

protocol MenuViewControllerDelegate: class {
    func menu(_ menu: MyFancyMenuViewController, didSelectItemAt index: Int, at point: CGPoint)
    func menuDidCancel(_ menu: MyFancyMenuViewController)
}

class MyFancyMenuViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    weak var delegate: MenuViewControllerDelegate?
    
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let rect = tableView.rectForRow(at: indexPath)
        var point = CGPoint(x: rect.midX, y: rect.midY)
        point = tableView.convert(point, to: nil)
        delegate?.menu(self, didSelectItemAt: indexPath.row, at: point)
    }
}
