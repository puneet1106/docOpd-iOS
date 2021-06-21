//
//  SignUpViewController.swift
//  DoctOPD (iOS)
//
//  Created by Puneet on 19/06/21.
//

import UIKit

class SignUpViewController: UIViewController {

    
    @IBOutlet weak var btnContinue: UIButton!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var pagingView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
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
    
    @IBAction func btnContinueAction(_ sender: UIButton) {
        if !(phoneNumberTextField.text?.isPhoneNumber ?? false) {
            self.showAlert(message: APPConstants.Alert.INVALID_MOBILE_NUMBER, title: APPConstants.Alert.ALERT_TITLE, OnViewController: self)
            return
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension SignUpViewController: UITextFieldDelegate {
    
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
