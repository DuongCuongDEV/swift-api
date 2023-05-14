//
//  TabBarViewController.swift
//  MyMovie
//
//  Created by Dương Văn Cường on 08/05/2023.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myTabBarItem0 = (self.tabBar.items?[0])! as UITabBarItem;
        myTabBarItem0.image = UIImage(named: "home")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal);
        myTabBarItem0.selectedImage = UIImage(named: "homeClick")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        
        let myTabBarItem1 = (self.tabBar.items?[1])! as UITabBarItem;
        myTabBarItem1.image = UIImage(named: "list")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal);
        myTabBarItem1.selectedImage = UIImage(named: "listClick")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        
        
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
