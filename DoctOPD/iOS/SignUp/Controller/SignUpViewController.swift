//
//  SignUpViewController.swift
//  DoctOPD (iOS)
//
//  Created by Puneet on 19/06/21.
//

import UIKit
import SVProgressHUD

class SignUpViewController: UIViewController {
    
    
    @IBOutlet weak var btnRegister: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    
    @IBOutlet weak var phoneNumberTFImageView: UIImageView!
    @IBOutlet weak var nameTFImageView: UIImageView!
    @IBOutlet weak var emailTFImageView: UIImageView!
    @IBOutlet weak var paswwordTFImageView: UIImageView!
    @IBOutlet weak var checkBoxButton: UIButton!
    @IBOutlet weak var termsCondtionsLabel: UILabel!

    var isValidName: Bool = false
    var isValidEmail: Bool = false
    var isValidPassword: Bool = false
    var isCheckBoxSelected: Bool = false
    
    var contactNumber : String?
    var viewModel = SignUpViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        setupViewModel()
        
    }
    
    func setUpUI(){
        
        nameTextField.addBorderAndColor(color: APPConstants.Colors.BORDER_COLOR, width: 0.8, corner_radius: 5.0, clipsToBounds: true)
        passwordTextField.addBorderAndColor(color: APPConstants.Colors.BORDER_COLOR, width: 0.8, corner_radius: 5.0, clipsToBounds: true)
        emailTextField.addBorderAndColor(color: APPConstants.Colors.BORDER_COLOR, width: 0.8, corner_radius: 5.0, clipsToBounds: true)
        phoneNumberTextField.addBorderAndColor(color: APPConstants.Colors.BORDER_COLOR, width: 0.8, corner_radius: 5.0, clipsToBounds: true)
        
        phoneNumberTextField.backgroundColor = APPConstants.Colors.VALID_TF_BG_COLOR
        phoneNumberTextField.isUserInteractionEnabled = false
        phoneNumberTFImageView.isHidden = false
        phoneNumberTextField.text = UserDefaults.standard.value(forKey: "phoneNumber") as? String
        phoneNumberTextField.addPadding(.left(10.0))
        phoneNumberTextField.addPadding(.right(25.0))
        
        nameTextField.addPadding(.left(10.0))
        nameTextField.addPadding(.right(25.0))
        nameTextField.delegate = self
        nameTextField.placeholder = APPConstants.SignUpScreen.NAME_FIELD_PLACEHOLDER
        nameTFImageView.isHidden = true

        passwordTextField.addPadding(.left(10.0))
        passwordTextField.addPadding(.right(25.0))
        passwordTextField.delegate = self
        passwordTextField.placeholder = APPConstants.SignUpScreen.PASSWORD_FIELD_PLACEHOLDER
        paswwordTFImageView.isHidden = true

        emailTextField.addPadding(.left(10.0))
        emailTextField.addPadding(.right(25.0))
        emailTextField.delegate = self
        emailTextField.placeholder = APPConstants.SignUpScreen.EMAIL_FIELD_PLACEHOLDER
        emailTFImageView.isHidden = true

        
        btnRegister.addBorderAndColor(color: APPConstants.Colors.BORDER_COLOR, width: 0.0, corner_radius: 5.0, clipsToBounds: true)
        btnRegister.backgroundColor = APPConstants.Colors.BUTTON_BG_COLOR
        setUpAttributedString()
    }
    
    
    func setUpAttributedString(){
        let text = APPConstants.SignUpScreen.Policy_Conditions_Text
        termsCondtionsLabel.text = text
        let underlineAttriString = NSMutableAttributedString(string: text)
        let range1 = (text as NSString).range(of: APPConstants.SignUpScreen.Terms_Conditions_Text)
        underlineAttriString.addAttribute(NSAttributedString.Key.foregroundColor, value: APPConstants.Colors.POLICY_CONDITIONS_COLOR, range: range1)
        
        let range2 = (text as NSString).range(of: APPConstants.SignUpScreen.Privacy_Policy_Text)
        underlineAttriString.addAttribute(NSAttributedString.Key.foregroundColor, value: APPConstants.Colors.POLICY_CONDITIONS_COLOR, range: range2)
        termsCondtionsLabel.attributedText = underlineAttriString
        termsCondtionsLabel.isUserInteractionEnabled = true
        termsCondtionsLabel.addGestureRecognizer(UITapGestureRecognizer(target:self, action: #selector(tapLabel(gesture:))))
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
            }
        }
        
        
    }
    
    func navigateToTabBarScreen(){
        let storyboard = UIStoryboard(name: APPConstants.StoryboardIdentifiers.TABBAR, bundle: nil)
        let newView = storyboard.instantiateViewController(withIdentifier: APPConstants.TabBarScreen.TABBAR_CONTROLLER) as! TabBarContollerClass
        newView.selectedIndex   =   0
        OPTUtilities.sharedInstance.AppObject.window?.rootViewController = newView
    }
    
    func goToTermsConditionVC(title: String, urlStr: String) {
        let storyboard : UIStoryboard   =   UIStoryboard(name: APPConstants.StoryboardIdentifiers.MORE, bundle: nil)
        let vc  =   storyboard.instantiateViewController(withIdentifier: APPConstants.TermsConditionScreen.TermsCondition_Controller) as! TermsCondition_VC
        vc.openUrl  =   urlStr
        vc.navigationtitle  = title
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func checkBoxAction(_ sender: UIButton) {
        checkBoxButton.isSelected = !checkBoxButton.isSelected
    }
    
    @IBAction func tapLabel(gesture: UITapGestureRecognizer) {
        guard let text = self.termsCondtionsLabel.text else { return }
        let privacyPolicyRange = (text as NSString).range(of: APPConstants.SignUpScreen.Privacy_Policy_Text)
        let termsAndConditionRange = (text as NSString).range(of: APPConstants.SignUpScreen.Terms_Conditions_Text)
        if gesture.didTapAttributedTextInLabel(label: self.termsCondtionsLabel, inRange: privacyPolicyRange) {
            self.goToTermsConditionVC(title: APPConstants.SignUpScreen.Privacy_Policy_Text, urlStr:APPConstants.APIPath.privacyPolicyURL)
        } else if gesture.didTapAttributedTextInLabel(label: self.termsCondtionsLabel, inRange: termsAndConditionRange){
            self.goToTermsConditionVC(title: APPConstants.SignUpScreen.Terms_Conditions_Text, urlStr: APPConstants.APIPath.termsAndConditionsURL)
        }
    }
    
    @IBAction func registerBtnActn(_ sender: UIButton) {
        
        if !isValidName {
            self.showMessage(APPConstants.SignUpScreen.Enter_ValidName_Placeholder, type: .info)
            return
        } else if !isValidEmail {
            self.showMessage(APPConstants.SignUpScreen.Enter_ValidEmail_Placeholder, type: .info)
            return
        } else if !isValidPassword {
            self.showMessage(APPConstants.SignUpScreen.Enter_ValidPassword_Placeholder, type: .info)
            return
        } else if !checkBoxButton.isSelected {
            self.showMessage(APPConstants.SignUpScreen.Policy_Conditions_Text, type: .info)
            return
        }
        
        guard let requestUrl = URL(string: APPConstants.APIPath.signUp) else {
            return
        }
       
        let requestParam : [String: String] = ["mobileNumber": contactNumber ?? UserDefaults.standard.value(forKey: "phoneNumber") as! String, "name": self.nameTextField.text!, "email": self.emailTextField.text!, "password": self.passwordTextField.text!, "source": "ANDRD","referralInviteCode": ""]
        
        viewModel.bindSignUpData(requestUrl: requestUrl, parameters: requestParam)
        
    }
    
}

extension SignUpViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if textField == nameTextField {
            
            if (textField.text?.count ?? 0 >= 2 && range.length == 0)
            {
                nameTextField.backgroundColor = APPConstants.Colors.VALID_TF_BG_COLOR
                nameTFImageView.isHidden = false
                isValidName = true
                return true
            }
            else {
                nameTextField.backgroundColor = UIColor.white
                nameTFImageView.isHidden = true
                isValidName = false
                return true
            }
        } else if textField == passwordTextField {
            
            if (textField.text?.count ?? 0 >= 3 && textField.text?.count ?? 0 <= 9 && range.length == 0)
            {
                passwordTextField.backgroundColor = APPConstants.Colors.VALID_TF_BG_COLOR
                paswwordTFImageView.isHidden = false
                isValidPassword = true
                return true
            }
            else {
                passwordTextField.backgroundColor = UIColor.white
                paswwordTFImageView.isHidden = true
                isValidPassword = false
                return true
            }
        } else if textField == emailTextField {
            
            if OPTUtilities.sharedInstance.isValidEmail(email: textField.text ?? "") {
                emailTextField.backgroundColor = APPConstants.Colors.VALID_TF_BG_COLOR
                emailTFImageView.isHidden = false
                isValidEmail = true
                return true
            } else {
                emailTextField.backgroundColor = UIColor.white
                emailTFImageView.isHidden = true
                isValidEmail = false
                return true
            }
            
        }
        return true
    }
}

extension UITapGestureRecognizer {
    
    func didTapAttributedTextInLabel(label: UILabel, inRange targetRange: NSRange) -> Bool {
         // Create instances of NSLayoutManager, NSTextContainer and NSTextStorage
         let layoutManager = NSLayoutManager()
         let textContainer = NSTextContainer(size: CGSize.zero)
         let textStorage = NSTextStorage(attributedString: label.attributedText!)

         // Configure layoutManager and textStorage
         layoutManager.addTextContainer(textContainer)
         textStorage.addLayoutManager(layoutManager)

         // Configure textContainer
         textContainer.lineFragmentPadding = 0.0
         textContainer.lineBreakMode = label.lineBreakMode
         textContainer.maximumNumberOfLines = label.numberOfLines
         let labelSize = label.bounds.size
         textContainer.size = labelSize

         // Find the tapped character location and compare it to the specified range
         let locationOfTouchInLabel = self.location(in: label)
         let textBoundingBox = layoutManager.usedRect(for: textContainer)
         //let textContainerOffset = CGPointMake((labelSize.width - textBoundingBox.size.width) * 0.5 - textBoundingBox.origin.x,
                                               //(labelSize.height - textBoundingBox.size.height) * 0.5 - textBoundingBox.origin.y);
         let textContainerOffset = CGPoint(x: (labelSize.width - textBoundingBox.size.width) * 0.5 - textBoundingBox.origin.x, y: (labelSize.height - textBoundingBox.size.height) * 0.5 - textBoundingBox.origin.y)

         //let locationOfTouchInTextContainer = CGPointMake(locationOfTouchInLabel.x - textContainerOffset.x,
                                                         // locationOfTouchInLabel.y - textContainerOffset.y);
         let locationOfTouchInTextContainer = CGPoint(x: locationOfTouchInLabel.x - textContainerOffset.x, y: locationOfTouchInLabel.y - textContainerOffset.y)
         let indexOfCharacter = layoutManager.characterIndex(for: locationOfTouchInTextContainer, in: textContainer, fractionOfDistanceBetweenInsertionPoints: nil)
         return NSLocationInRange(indexOfCharacter, targetRange)
     }
}
