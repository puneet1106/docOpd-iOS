//
//  SignInViewController.swift
//  DoctOPD (iOS)
//
//  Created by Puneet on 23/06/21.
//

import UIKit
import SVProgressHUD

class SignInViewController: UIViewController {

    
    @IBOutlet weak var btnContinue: UIButton!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var pagingView: UIView!
    
    var viewModel = SignInViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        setupViewModel()

    }
    
    func setUpUI(){
        let storyboard = UIStoryboard(name: APPConstants.StoryboardIdentifiers.ONBOARDING, bundle: Bundle.main)
        let pageControlVC = storyboard.instantiateViewController(withIdentifier: APPConstants.OnboardingScreen.PAGE_CONTROL_SCREEN)
        addChild(pageControlVC)
        pageControlVC.view.frame = pagingView.bounds
        pagingView.addSubview(pageControlVC.view)
        pageControlVC.didMove(toParent: self)
        phoneNumberTextField.addBorderAndColor(color: APPConstants.Colors.BORDER_COLOR, width: 1.5, corner_radius: 5.0, clipsToBounds: true)
        btnContinue.addBorderAndColor(color: APPConstants.Colors.BORDER_COLOR, width: 0.0, corner_radius: 5.0, clipsToBounds: true)
        btnContinue.backgroundColor = APPConstants.Colors.BUTTON_BG_COLOR
        phoneNumberTextField.addPadding(.both(15.0))
        phoneNumberTextField.delegate = self
        phoneNumberTextField.placeholder = APPConstants.OnboardingScreen.MOBILE_FIELD_PLACEHOLDER
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
            if self?.viewModel.model?.status == 1001 || self?.viewModel.model?.status == 200 {
                self?.navigateToOTPScreen()
            }
        }
        
    
    }

    func navigateToOTPScreen(){
        let storyboard = UIStoryboard(name: APPConstants.StoryboardIdentifiers.SIGNUP, bundle: nil)
        let newView = storyboard.instantiateViewController(withIdentifier: APPConstants.SignUpScreen.OTP_SCREEN) as! OTPViewController
        newView.phoneNumber = self.phoneNumberTextField.text ?? ""
        if self.viewModel.model?.status == 1001 {
            newView.registrationStatus = .NotRegistered
        } else if self.viewModel.model?.status == 200 {
            newView.registrationStatus = .AlreadyRegistered
        }
        self.navigationController?.pushViewController(newView, animated: true)
    }
    
    @IBAction func btnContinueAction(_ sender: UIButton) {
        if !(phoneNumberTextField.text?.isPhoneNumber ?? false) {
            self.showAlert(message: APPConstants.Alert.INVALID_MOBILE_NUMBER, title: APPConstants.Alert.ALERT_TITLE, OnViewController: self)
            return
        }
        
        guard let requestUrl = URL(string: APPConstants.APIPath.signIn) else {
           return
        }
        let requestParam : [String: String] = ["mobileNumber": phoneNumberTextField.text ?? ""]
         
        viewModel.bindLoginData(requestUrl: requestUrl, parameters: requestParam)
        
    }
    
}

extension SignInViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if (textField.text?.count ?? 0 >= 10 && range.length == 0)
            {
                return false
            }
            else {
                return true
            }
    }
}
