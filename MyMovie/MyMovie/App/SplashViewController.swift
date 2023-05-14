//
//  SplashViewController.swift
//  MyMovie
//
//  Created by Dương Văn Cường on 10/05/2023.
//

import UIKit

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.pushTabBar()
        // Do any additional setup after loading the view.
    }
    

    func pushTabBar() {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: TabBarViewController.className) as! TabBarViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }

}
