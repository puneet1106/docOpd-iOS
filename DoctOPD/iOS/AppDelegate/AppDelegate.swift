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
    var initialViewController: UIViewController?
    var storyboard: UIStoryboard?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true
       
        window = UIWindow(frame: UIScreen.main.bounds)
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        if UserDefaults.standard.value(forKey: "userId") != nil{
             storyboard = UIStoryboard(name: APPConstants.StoryboardIdentifiers.TABBAR, bundle: nil)
            let initialViewController = storyboard?.instantiateViewController(withIdentifier: APPConstants.TabBarScreen.TABBAR_CONTROLLER) as! TabBarContollerClass
            initialViewController.selectedIndex   =   0
            let nvc: UINavigationController = UINavigationController(rootViewController: initialViewController)
            nvc.setNavigationBarHidden(true, animated: false)
            appDelegate?.window?.rootViewController = nvc
          
        } else {
             storyboard = UIStoryboard(name: APPConstants.StoryboardIdentifiers.SIGNUP, bundle: nil)
            initialViewController = storyboard?.instantiateViewController(withIdentifier: "SignInViewController") as! SignInViewController
            let nvc: UINavigationController = UINavigationController(rootViewController: initialViewController!)
            nvc.setNavigationBarHidden(true, animated: false)
            appDelegate?.window?.rootViewController = nvc
        }
       
       
        appDelegate?.window?.makeKeyAndVisible()
        return true
    }
    
    
}

