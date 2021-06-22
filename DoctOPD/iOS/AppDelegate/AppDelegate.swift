//
//  AppDelegate.swift
//  DoctOPD (iOS)
//
//  Created by Puneet on 19/06/21.
//


import UIKit
import IQKeyboardManagerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true

        window = UIWindow(frame: UIScreen.main.bounds)
        let storyboard = UIStoryboard(name: "SignUp", bundle: nil)
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let initialViewController = storyboard.instantiateViewController(withIdentifier: "SignInViewController") as! SignInViewController
        let nvc: UINavigationController = UINavigationController(rootViewController: initialViewController)
        nvc.setNavigationBarHidden(true, animated: false)
        appDelegate?.window?.rootViewController = nvc
        appDelegate?.window?.makeKeyAndVisible()
        return true
    }
    
    
}

