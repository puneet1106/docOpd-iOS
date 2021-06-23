//
//  PasswordViewController.swift
//  DoctOPD (iOS)
//
//  Created by Puneet on 23/06/21.
//

import UIKit
import SVProgressHUD

class PasswordViewController: UIViewController {

    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var useOTPButton: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var viewModel = PasswordViewModel()
    var phoneNumber : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        // Do any additional setup after loading the view.
    }
    
    func setUpUI(){       
        continueButton.addBorderAndColor(color: UIColor.clear, width: 0.0, corner_radius: 5.0, clipsToBounds: true)
        useOTPButton.addBorderAndColor(color: APPConstants.Colors.BORDER_COLOR, width: 1.0, corner_radius: 5.0, clipsToBounds: true)
        backButton.addBorderAndColor(color: UIColor.clear, width: 0.0, corner_radius: 0.5 * backButton.bounds.size.width, clipsToBounds: true)
        passwordTextField.addBorderAndColor(color: APPConstants.Colors.BORDER_COLOR, width: 0.8, corner_radius: 5.0, clipsToBounds: true)
        passwordTextField.placeholder = APPConstants.PasswordScreen.Enter_Password_Placeholder
        passwordTextField.addPadding(.both(15.0))
        setupViewModel()
    }
    
    fileprivate func setupViewModel() {
        
        self.viewModel.showAlertClosure = { [weak self] in
            let alert = self?.viewModel.alertMessage ?? ""
            print(alert)
            self?.showMessage(alert, type: .info)
        }
        
        self.viewModel.updateLoadingStatus = { [weak self] in
            if self?.viewModel.isLoading ?? false {
                SVProgressHUD.setBackgroundColor(UIColor.clear)
                SVProgressHUD.show()
                SVProgressHUD.setDefaultMaskType(.clear)
            } else {
                SVProgressHUD.dismiss()
                print("DATA READY")
            }
        }
        
        self.viewModel.internetConnectionStatus = { [weak self] in
            print("Internet disconnected")
            // show UI Internet is disconnected
            let alert = self?.viewModel.alertMessage ?? ""
            print(alert)
            self?.showMessage(alert, type: .info)
        }
        
        self.viewModel.serverErrorStatus = { [weak self] in
            print("Server Error / Unknown Error")
            // show UI Server is Error
            let alert = self?.viewModel.alertMessage ?? ""
            print(alert)
            self?.showMessage(alert, type: .info)
        }
        
        self.viewModel.didGetData = { [weak self] in
            if self?.viewModel.model?.status == 200 {
                self?.navigateToTabBarScreen()
            } else if self?.viewModel.model?.status == 1001 {
                self?.showMessage(self?.viewModel.model?.message ?? APPConstants.COMMON_VALIDATION.ERROR_MSG.rawValue, type: .info)
            }else {
                self?.showMessage(self?.viewModel.model?.message ?? APPConstants.COMMON_VALIDATION.ERROR_MSG.rawValue, type: .info)
            }
        }
    }
    
    func navigateToTabBarScreen(){
        let storyboard = UIStoryboard(name: APPConstants.StoryboardIdentifiers.TABBAR, bundle: nil)
        let newView = storyboard.instantiateViewController(withIdentifier: APPConstants.TabBarScreen.TABBAR_CONTROLLER) as! TabBarContollerClass
        newView.selectedIndex   =   0
        OPTUtilities.sharedInstance.AppObject.window?.rootViewController = newView
    }
   
    @IBAction func backButtonAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func continueActn(_ sender: UIButton) {
        if passwordTextField.text?.count == 0 {
            return
        }
        
        guard let requestUrl = URL(string: APPConstants.APIPath.loginWithPassword) else {
           return
        }
        
        let requestParam : [String: String] = ["mobileNumber": phoneNumber ?? UserDefaults.standard.value(forKey: "phoneNumber") as! String, "password": passwordTextField.text ?? ""]
        viewModel.bindPasswordVerifyData(requestUrl: requestUrl, parameters: requestParam)
    }
    
    @IBAction func useOTPButtonActn(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
