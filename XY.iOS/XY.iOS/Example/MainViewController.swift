//
//  MainViewController.swift
//  XY.iOS
//
//  Created by Lix on 2017/8/14.
//  Copyright © 2017年 Lix. All rights reserved.
//

import UIKit
import SideMenu

class MainViewController: UIViewController {
    
    var navigator: UINavigationController!
    
    lazy fileprivate var menuAnimator: MenuTransitionAnimator! = MenuTransitionAnimator.init(mode: .presentation, shouldPassEventsOutsideMenu: false) { [unowned self] in
        self.dismiss(animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch (segue.identifier, segue.destination) {
        case (.some("presentMenu"), let menu as MyFancyMenuViewController):
            menu.delegate = self
            menu.transitioningDelegate = self
            menu.modalPresentationStyle = .custom
            
        default:
            super.prepare(for: segue, sender: sender)
        }
    }
    
    @IBAction func btnAction(_ sender: Any) {
        let meunViewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MyFancyMenuViewController")
        self.present(meunViewController, animated: true, completion: nil)
    }
}

extension MainViewController: MenuViewControllerDelegate {
    func menu(_ menu: MyFancyMenuViewController, didSelectItemAt index: Int, at point: CGPoint) {
//        DispatchQueue.main.async {
//            self.dismiss(animated: true, completion: nil)
//        }
    }
    
    func menuDidCancel(_ menu: MyFancyMenuViewController) {
//        dismiss(animated: true, completion: nil)
    }
}

extension MainViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return menuAnimator
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return MenuTransitionAnimator(mode: .dismissal)
    }
}
