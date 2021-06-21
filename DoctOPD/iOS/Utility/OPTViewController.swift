//
//  OPTViewController.swift
//  Optimus-ios
//
//  Created by SHALINI PADMANABHAN on 24/09/19.
//  Copyright © 2019 Tata Communications Ltd. All rights reserved.
//

import UIKit
//import NVActivityIndicatorView
import CoreLocation

class OPTViewController: UIViewController, UIDocumentInteractionControllerDelegate {
   // var activityIndicator: NVActivityIndicatorView?
    var locationManager: CLLocationManager?
    var latitude: Double = 0.0
    var longitude: Double = 0.0
    var docController: UIDocumentInteractionController?
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewDidDisappear(_ animated: Bool) {
        self.view.endEditing(true)
    }
   

    func showAlertWithActions(message: String?, title: String?, actions: [UIAlertAction]?, OnViewController: UIViewController) {
        guard let alertActions = actions, !alertActions.isEmpty else {
            showAlert(message: message, title: title, OnViewController: OnViewController)
            return
        }
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)

        for action in alertActions {
            alert.addAction(action)
        }
        OnViewController.present(alert, animated: true, completion: nil)
    }
}

/*extension OPTViewController: NVActivityIndicatorViewable {
    func startLoader(color: UIColor = .black) {
        DispatchQueue.main.async {
            self.startAnimating(CGSize(width: 50.0, height: 50.0), type: NVActivityIndicatorType.circleStrokeSpin, color: APPConstants.Color.LOADING_INDICATOR, backgroundColor: .clear)
        }
    }
    func stopLoader() {
        DispatchQueue.main.async {
            self.stopAnimating()
        }
    }
}*/
typealias LocationManager = OPTViewController
extension LocationManager: CLLocationManagerDelegate {
    func getUserCurrentLocation() {
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.desiredAccuracy = kCLLocationAccuracyBest
        locationManager?.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager?.startUpdatingLocation()
        }
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation: CLLocation = locations[0] as CLLocation
        latitude = userLocation.coordinate.latitude
        longitude = userLocation.coordinate.longitude
        // Call stopUpdatingLocation() to stop listening for location updates,
        // other wise this function will be called every time when user location changes.
        manager.stopUpdatingLocation()
        print("user latitude = \(userLocation.coordinate.latitude)")
        print("user longitude = \(userLocation.coordinate.longitude)")
        NotificationCenter.default.post(name: Notification.Name(rawValue: APPConstants.Location.LOCATION_CHANGED ), object: nil)
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error \(error)")
    }
}
typealias DownloadAttachmentPreview = OPTViewController
extension DownloadAttachmentPreview {
    func previewDownloadedDoc(filePath: URL, viewController: UIViewController) {
        DispatchQueue.main.async {
           // self.stopLoader()
            let fileName = filePath.absoluteString.components(separatedBy: "/")
            self.docController = UIDocumentInteractionController(url: filePath)
            self.docController?.name = fileName.last
            self.docController?.delegate = viewController as? UIDocumentInteractionControllerDelegate
            self.docController?.presentPreview(animated: false)
        }
    }
    /*func documentInteractionControllerViewForPreview(_ controller: UIDocumentInteractionController) -> UIView? {
        self.view
    }*/
    func documentInteractionControllerViewControllerForPreview(_ controller: UIDocumentInteractionController) -> UIViewController {
        let viewController = self
        return viewController
    }
    func documentInteractionControllerRectForPreview(_ controller: UIDocumentInteractionController) -> CGRect {
        let frame = self.view.frame
        return frame
    }
}
extension OPTViewController {
    func setupToHideKeyboardOnTapOnView() {
        let tap = UITapGestureRecognizer (
            target: self,
            action: #selector(OPTViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

extension UIViewController {
    func showAlert(message: String?, title: String?, OnViewController: UIViewController) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        var rootViewController = UIApplication.shared.keyWindow?.rootViewController
        if let navigationController = rootViewController as? UINavigationController {
            rootViewController = navigationController.viewControllers.first
        }
        if let tabBarController = rootViewController as? UITabBarController {
            rootViewController = tabBarController.selectedViewController
        }
        let action = UIAlertAction(title: APPConstants.Alert.ALERT_ACTION_OK, style: .default, handler: nil)
        alertController.addAction(action)
        rootViewController?.present(alertController, animated: true, completion: nil)
    
    }
}


