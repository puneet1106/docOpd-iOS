//
//  HomeViewModel.swift
//  DoctOPD (iOS)
//
//  Created by Puneet on 26/06/21.
//


import Foundation
import Alamofire

class HomeViewModel {
    
    var errorCallBack:((String)->())?
    
    var model: CategoryList?{
        didSet {
            print("Login Status code =", model?.status ?? 0)
        }
    }
    
    var shortlistDoctorListModel: ShortlistDoctorList?{
        didSet {
            print("Login Status code =", shortlistDoctorListModel?.status ?? 0)
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
    var didGetCategoryListData: (() -> ())?
    var didGetShortlistDoctorData: (() -> ())?

    
    init() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.networkStatusChanged(_:)), name: NSNotification.Name(rawValue: ReachabilityStatusChangedNotification), object: nil)
        Reach().monitorReachabilityChanges()
        
    }
    
    //MARK: Internet monitor status
    @objc func networkStatusChanged(_ notification: Notification) {
        self.networkStatus = Reach().connectionStatus()
    }
    
    //MARK: -- Example Func
    func bindGetCategoryListData(requestUrl: URL, parameters:[String: String]) {
        
        switch Reach().connectionStatus() {
        case .offline:
            self.isDisconnected = true
            self.internetConnectionStatus?()
        case .online:
            self.isLoading = true
            Alamofire.request(requestUrl, method: .get, parameters: parameters).responseJSON { response in
                self.isLoading = false
                switch response.result {
                case .success:
                    print("result is \(String(describing: response.result.value))")
                    do {
                        
                        let model = try JSONDecoder().decode(CategoryList.self, from: response.data!)
                        print("model is\(String(describing: model.category?.count))")
                        self.model = model
                        self.didGetCategoryListData?()
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
    
    //MARK: -- Example Func
    func bindGetShortlistedDoctorList(requestUrl: URL, parameters:[String: String]) {
        
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
                        
                        let model = try JSONDecoder().decode(ShortlistDoctorList.self, from: response.data!)
                        print("shortlist model is\(String(describing: model.shortlistDoctors?.count))")
                        self.shortlistDoctorListModel = model
                        self.didGetShortlistDoctorData?()
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


