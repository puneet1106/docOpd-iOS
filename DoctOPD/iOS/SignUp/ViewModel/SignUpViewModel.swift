//
//  SignUpViewModel.swift
//  DoctOPD (iOS)
//
//  Created by Puneet on 22/06/21.
//

import Foundation
import Alamofire

class SignUpViewModel {
    
    var errorCallBack:((String)->())?
    
    var model: SignUpModel?{
        didSet {
            print("Login Status code =", model?.status ?? 0)
        }
    }
    
    /// Count your data in model
    var count: Int = 0
    
    //MARK: -- Network checking
    
    /// Define networkStatus for check network connection
    var networkStatus = Reach().connectionStatus()
    
    /// Define boolean for internet status, call when network disconnected
    var isDisconnected: Bool = false {
        didSet {
            //            self.alertMessage = "No network connection. Please connect to the internet"
            self.alertMessage   =   APPConstants.COMMON_VALIDATION.NO_INTERNET.rawValue
            self.internetConnectionStatus?()
        }
    }
    
    //MARK: -- UI Status
    
    /// Update the loading status, use HUD or Activity Indicator UI
    var isLoading: Bool = false {
        didSet {
            self.updateLoadingStatus?()
        }
    }
    
    /// Showing alert message, use UIAlertController or other Library
    var alertMessage: String? {
        didSet {
            self.showAlertClosure?()
        }
    }
    
    /// Define selected model
    var selectedObject: SignUpModel?
    
    //MARK: -- Closure Collection
    var showAlertClosure: (() -> ())?
    var updateLoadingStatus: (() -> ())?
    var internetConnectionStatus: (() -> ())?
    var serverErrorStatus: (() -> ())?
    var didGetData: (() -> ())?
    var userNotRegisteredCallack:(()->())?
    
    init() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.networkStatusChanged(_:)), name: NSNotification.Name(rawValue: ReachabilityStatusChangedNotification), object: nil)
        Reach().monitorReachabilityChanges()
        
    }
    
    //MARK: Internet monitor status
    @objc func networkStatusChanged(_ notification: Notification) {
        self.networkStatus = Reach().connectionStatus()
    }
    
    //MARK: -- Example Func
    func bindSignUpData(requestUrl: URL, parameters:[String: String]) {
        print("requestUrl is \(requestUrl.absoluteString) and parameters are \(parameters)")
        switch Reach().connectionStatus() {
        case .offline:
            self.isDisconnected = true
            self.internetConnectionStatus?()
        case .online:
            self.isLoading = true
           
            Alamofire.request(requestUrl, method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON { response in
                self.isLoading = false
                switch response.result {
                case .success:
                    let result = response.result.value
                    do {
                        let model = try JSONDecoder().decode(SignUpModel.self, from: response.data!)
                        print("model is\(model)")
                        if let userId = model.user?.userId {
                            UserDefaults.standard.setValue(userId, forKey: "userId")
                            UserDefaults.standard.synchronize()
                        }
                        
                        if let inviteCode = model.user?.inviteCode {
                            UserDefaults.standard.setValue(inviteCode, forKey: "inviteCode")
                            UserDefaults.standard.synchronize()
                        }
                        
                        if let userModel = model.user {
                            OPTUtilities.sharedInstance.saveUserData(model: userModel)
                        }
                        self.model = model
                        self.didGetData?()
                    } catch let error as NSError {
                        print(String(describing: error))
                    }
                    print(result)
                case .failure(let error):
                    let responseString = String(data: response.data ?? Data(), encoding:.utf8)
                    print("error description\(error)")
                //                self.alertMessage   =   error
                default:
                    break
                    
                }
            }
        default:
            break
        }
    }
    
}

extension SignUpViewModel {
    
}
