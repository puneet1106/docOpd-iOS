//
//  AppDelegate.swift
//  DoctOPD (iOS)
//
//  Created by Puneet on 19/06/21.
//


import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let storyboard = UIStoryboard(name: "SignUp", bundle: nil)
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let initialViewController = storyboard.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
        let nvc: UINavigationController = UINavigationController(rootViewController: initialViewController)
        nvc.setNavigationBarHidden(true, animated: false)
        appDelegate?.window?.rootViewController = nvc
        appDelegate?.window?.makeKeyAndVisible()
        return true
    }
    
    
}

