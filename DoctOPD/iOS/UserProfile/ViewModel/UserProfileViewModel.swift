//
//  UserProfileViewModel.swift
//  DoctOPD (iOS)
//
//  Created by Puneet on 30/06/21.
//


import Foundation
import Alamofire

class UserProfileViewModel {
    
    var errorCallBack:((String)->())?
    
    var model: UserPoliciesModel?{
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
    var selectedObject: OTPModel?
    
    //MARK: -- Closure Collection
    var showAlertClosure: (() -> ())?
    var updateLoadingStatus: (() -> ())?
    var internetConnectionStatus: (() -> ())?
    var serverErrorStatus: (() -> ())?
    var didGetUserInsuranceListData: (() -> ())?

    init() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.networkStatusChanged(_:)), name: NSNotification.Name(rawValue: ReachabilityStatusChangedNotification), object: nil)
        Reach().monitorReachabilityChanges()
        
    }
    
    //MARK: Internet monitor status
    @objc func networkStatusChanged(_ notification: Notification) {
        self.networkStatus = Reach().connectionStatus()
    }
    
    //MARK: -- Example Func
    func bindGetUserInsuranceListData(requestUrl: URL, parameters:[String: String]) {
        
        switch Reach().connectionStatus() {
        case .offline:
            self.isDisconnected = true
            self.internetConnectionStatus?()
        case .online:
            self.isLoading = true
            Alamofire.request(requestUrl, method: .post, parameters: parameters).responseJSON { response in
                self.isLoading = false
                switch response.result {
                case .success:
                    print("result is \(String(describing: response.result.value))")
                    do {
                        
                        let model = try JSONDecoder().decode(UserPoliciesModel.self, from: response.data!)
                        self.model = model
                        self.didGetUserInsuranceListData?()
                    } catch let error as NSError {
                        print(String(describing: error))
                    }
                
                case .failure(let error):
                    _ = String(data: response.data ?? Data(), encoding:.utf8)
                    print("error description\(error.localizedDescription)")
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


