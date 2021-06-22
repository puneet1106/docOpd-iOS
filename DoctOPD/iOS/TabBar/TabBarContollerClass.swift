//
//  TabBarContollerClass.swift
//  DoctOPD (iOS)
//
//  Created by Puneet on 23/06/21.
//

import UIKit

class TabBarContollerClass: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // UITabBarDelegate
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
     
    }
    
    // UITabBarControllerDelegate
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("Selected view controller")
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        print("shouldSelect view controller")

        return true
    }
}
