//
//  InviteFriendsViewController.swift
//  DoctOPD (iOS)
//
//  Created by Puneet on 04/07/21.
//


import UIKit
import SVProgressHUD

class InviteFriendsViewController: UIViewController {

    
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var inviteCodeView: UIView!
    @IBOutlet weak var inviteCodeLabel: UILabel!
    @IBOutlet weak var shareNowButton: UIButton!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var inviteCodeTextField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var inviteView: UIView!
    @IBOutlet weak var inviteViewHeightConstraint: NSLayoutConstraint!
    
    var isInviteSectionShow: Bool = false
    
    var viewModel = InviteFriendViewModel()

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setUpUI()
        setupViewModel()
    }
    
    func setUpUI(){
        headerView.layer.cornerRadius = 65
        headerView.layer.maskedCorners = [.layerMaxXMaxYCorner]
        inviteCodeTextField.addBorderAndColor(color: APPConstants.Colors.BORDER_COLOR, width: 1.5, corner_radius: 5.0, clipsToBounds: true)
        inviteCodeTextField.addPadding(.both(15.0))
        inviteCodeTextField.placeholder = APPConstants.InViteFriendScreen.INVITEFRIEND_FIELD_PLACEHOLDER
        
        inviteCodeView.addBorderAndColor(color: APPConstants.Colors.BORDER_COLOR, width: 1.5, corner_radius: 5.0, clipsToBounds: true)
        
        shareNowButton.addBorderAndColor(color: APPConstants.Colors.BORDER_COLOR, width: 0.0, corner_radius: 5.0, clipsToBounds: true)
        
        submitButton.addBorderAndColor(color: APPConstants.Colors.BORDER_COLOR, width: 0.0, corner_radius: 5.0, clipsToBounds: true)
        
        /*
         if let inviteCode = model.user?.inviteCode {
             UserDefaults.standard.setValue(inviteCode, forKey: "inviteCode")
             UserDefaults.standard.synchronize()
         }

         */
        
        if let inviteCode = UserDefaults.standard.value(forKey: "inviteCode")  {
            inviteCodeLabel.text = inviteCode as? String
        }

        if isInviteSectionShow {
            self.inviteViewHeightConstraint.constant = 192.0
            inviteView.isHidden = false
        } else {
            self.inviteViewHeightConstraint.constant = 0.0
            inviteView.isHidden = true
        }
        
        setUpAttributedString()
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
            self?.navigationController?.popViewController(animated: true)
        }
        
    
    }
    
    func submitInviteCode(){
        guard let requestUrl = URL(string: APPConstants.APIPath.submitInviteCode) else {
           return
        }
        
        guard let inviteCode = UserDefaults.standard.value(forKey: "inviteCode") else {
            return
        }

        
        let requestParam : [String: String] = ["inviteCode": inviteCode as! String, "points": "100"]
        viewModel.bindSubmitInviteCode(requestUrl: requestUrl, parameters: requestParam)
    }
    
    func setUpAttributedString(){
        let text = APPConstants.InViteFriendScreen.Description_InviteFriend
        
        let titleAttributes = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18.0)
        ]
        let attributedString = NSMutableAttributedString(string:APPConstants.InViteFriendScreen.Description_InviteFriend, attributes: titleAttributes)
    
//        NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 30.0),

        let range1 = (text as NSString).range(of: APPConstants.InViteFriendScreen.title1)
        attributedString.addAttribute(NSAttributedString.Key.font, value: UIFont.boldSystemFont(ofSize: 22.0), range: range1)
        
        let range2 = (text as NSString).range(of: APPConstants.InViteFriendScreen.title2)
        attributedString.addAttribute(NSAttributedString.Key.font, value: UIFont.boldSystemFont(ofSize: 20.0), range: range2)
        
        let range3 = (text as NSString).range(of: APPConstants.InViteFriendScreen.title3)
        attributedString.addAttribute(NSAttributedString.Key.font, value: UIFont.boldSystemFont(ofSize: 20.0), range: range3)
        
        let range4 = (text as NSString).range(of: APPConstants.InViteFriendScreen.title4)
        attributedString.addAttribute(NSAttributedString.Key.font, value: UIFont.boldSystemFont(ofSize: 20.0), range: range4)
        
        let range5 = (text as NSString).range(of: APPConstants.InViteFriendScreen.title5)
        attributedString.addAttribute(NSAttributedString.Key.font, value: UIFont.boldSystemFont(ofSize: 20.0), range: range5)
        
        descriptionLabel.attributedText = attributedString
    }
    

    @IBAction func backButtonAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func shareNowButtonActn(_ sender: UIButton) {
        if let inviteCode = UserDefaults.standard.value(forKey: "inviteCode")  {
            let items = ["Add this invite code and earn 100 point to your Doctopd Account. Invite code is '\(inviteCode as? String)'"]
            let ac = UIActivityViewController(activityItems: items, applicationActivities: nil)
            present(ac, animated: true)
        }
       
    }
    
    
    @IBAction func submitButtonAction(_ sender: UIButton) {
    
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
