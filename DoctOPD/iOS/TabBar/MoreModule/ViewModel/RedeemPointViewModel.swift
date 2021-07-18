//
//  RedeemPointViewModel.swift
//  DoctOPD (iOS)
//
//  Created by Puneet on 06/07/21.
//

import Foundation
import Alamofire

class RedeemPointViewModel {
    
    var errorCallBack:((String)->())?
    
    var userPolicyModel: UserPoliciesModel?{
        didSet {
            print("Login Status code =", userPolicyModel?.status ?? 0)
        }
    }
    
//    var model: MoreModel?{
//        didSet {
//            print("Login Status code =", model?.status ?? 0)
//        }
//    }
    
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
    
    //MARK: -- Closure Collection
    var showAlertClosure: (() -> ())?
    var updateLoadingStatus: (() -> ())?
    var internetConnectionStatus: (() -> ())?
    var serverErrorStatus: (() -> ())?
    var didGetData: ((_ message:String) -> ())?
    var didGetPolicyData: (() -> ())?

    
    init() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.networkStatusChanged(_:)), name: NSNotification.Name(rawValue: ReachabilityStatusChangedNotification), object: nil)
        Reach().monitorReachabilityChanges()
        
    }
    
    //MARK: Internet monitor status
    @objc func networkStatusChanged(_ notification: Notification) {
        self.networkStatus = Reach().connectionStatus()
    }
    
    //MARK: -- Example Func
    func bindSubmitRedeemRewardPoints(requestUrl: URL, parameters:[String: String]) {
        
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
                    let result = response.result.value
                    do {
                       /* let model = try JSONDecoder().decode(MoreModel.self, from: response.data!)
                        print("model is\(model)")
                       
                        self.model = model*/
                        if let message = (result as? NSDictionary)?.value(forKey: "message") {
                            self.didGetData?(message as! String)
                        }

                       // self.didGetData?()
                    } catch let error as NSError {
                        print(String(describing: error))
                    }
                    
                    /*
                     self?.isLoading = false
                     self?.model = response
                     self?.didGetData?()*/
                    print(result)
                case .failure(let error):
                    let responseString = String(data: response.data ?? Data(), encoding:.utf8)
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
                        self.userPolicyModel = model
                        self.didGetPolicyData?()
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