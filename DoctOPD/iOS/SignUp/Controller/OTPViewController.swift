//
//  OTPViewController.swift
//  DoctOPD (iOS)
//
//  Created by Puneet on 22/06/21.
//

import UIKit
import SVProgressHUD

class OTPViewController: UIViewController {
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var usePasswordButton: UIButton!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var otpContainerView: UIView!
    
    var viewModel = OTPViewModel()
    var phoneNumber : String = ""
    var registrationStatus = APPConstants.UserRegistrationStatus.NotRegistered
    let otpStackView = OTPStackView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        // Do any additional setup after loading the view.
    }
    
    func setUpUI(){
        continueButton.isUserInteractionEnabled = false
        otpContainerView.addSubview(otpStackView)
        otpStackView.delegate = self
        otpStackView.heightAnchor.constraint(equalTo: otpContainerView.heightAnchor).isActive = true
        otpStackView.centerXAnchor.constraint(equalTo: otpContainerView.centerXAnchor).isActive = true
        otpStackView.centerYAnchor.constraint(equalTo: otpContainerView.centerYAnchor).isActive = true
        phoneNumberLabel.text = APPConstants.OTPScreen.Enter_Code_Msg + phoneNumber
        UserDefaults.standard.setValue(phoneNumber, forKey: "phoneNumber")
        UserDefaults.standard.synchronize()

        continueButton.addBorderAndColor(color: UIColor.clear, width: 0.0, corner_radius: 5.0, clipsToBounds: true)
        usePasswordButton.addBorderAndColor(color: APPConstants.Colors.BORDER_COLOR, width: 1.0, corner_radius: 5.0, clipsToBounds: true)
        backButton.addBorderAndColor(color: UIColor.clear, width: 0.0, corner_radius: 0.5 * backButton.bounds.size.width, clipsToBounds: true)
        showHidePasswordButton()
        setupViewModel()
    }
    
    func showHidePasswordButton(){
        if registrationStatus == .NotRegistered {
            usePasswordButton.isHidden = true
        } else {
            usePasswordButton.isHidden = false
        }
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
            if self?.viewModel.model?.status == 1001 {
                self?.navigateToSignUpScreen()
            } else if self?.viewModel.model?.status == 200 {
                self?.navigateToTabBarScreen()
            } else {
                self?.showMessage(self?.viewModel.model?.message ?? APPConstants.COMMON_VALIDATION.ERROR_MSG.rawValue, type: .info)
            }
        }
    }
    
    func navigateToSignUpScreen(){
        let storyboard = UIStoryboard(name: APPConstants.StoryboardIdentifiers.SIGNUP, bundle: nil)
        let newView = storyboard.instantiateViewController(withIdentifier: APPConstants.SignUpScreen.SignUp_SCREEN) as! SignUpViewController
        self.navigationController?.pushViewController(newView, animated: true)
    }
    
    func navigateToTabBarScreen(){
        let storyboard = UIStoryboard(name: APPConstants.StoryboardIdentifiers.TABBAR, bundle: nil)
        let newView = storyboard.instantiateViewController(withIdentifier: APPConstants.TabBarScreen.TABBAR_CONTROLLER) as! TabBarContollerClass
        newView.selectedIndex   =   0
        OPTUtilities.sharedInstance.AppObject.window?.rootViewController = newView
    }
    
    
    func navigateToPasswordScreen(){
        let storyboard = UIStoryboard(name: APPConstants.StoryboardIdentifiers.SIGNUP, bundle: nil)
        let newView = storyboard.instantiateViewController(withIdentifier: APPConstants.SignUpScreen.Password_SCREEN) as! PasswordViewController
        newView.phoneNumber = phoneNumber
        self.navigationController?.pushViewController(newView, animated: true)
    }
    
    @IBAction func backButtonAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
     @IBAction func continueActn(_ sender: UIButton) {
        guard let requestUrl = URL(string: APPConstants.APIPath.loginWithOTP) else {
           return
        }
        
        let requestParam : [String: String] = ["mobileNumber": phoneNumber, "otp": otpStackView.getOTP()]
        viewModel.bindOTPVerifyData(requestUrl: requestUrl, parameters: requestParam)
     }
    
    @IBAction func usePasswordButtonActn(_ sender: UIButton) {
        self.navigateToPasswordScreen()
    }
    
}

extension OTPViewController: OTPDelegate {
    
    func didChangeValidity(isValid: Bool) {
        continueButton.isUserInteractionEnabled = isValid
    }
    
}
