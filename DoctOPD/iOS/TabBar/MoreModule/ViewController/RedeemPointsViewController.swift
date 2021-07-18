//
//  RedeemPointsViewController.swift
//  DoctOPD (iOS)
//
//  Created by Puneet on 05/07/21.
//

import UIKit
import SVProgressHUD
import MessageUI
import Messages

class RedeemPointsViewController: UIViewController {

    
    @IBOutlet weak var redeemDesciptionLabel: UILabel!
    @IBOutlet weak var notPurchasedLabel: UILabel!
    @IBOutlet weak var totalRewardPointView: UIView!
    @IBOutlet weak var pointWorthView: UIView!
    @IBOutlet weak var pointWorthLabel: UILabel!
    @IBOutlet weak var totalRewardLabel: UILabel!
    @IBOutlet weak var submitButton: UIButton!
    
    var totalPoints: Int = 0
    var pointsValue: Int = 0
    var isRedeemBlocked: Bool = false
    var viewModel = RedeemPointViewModel()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        setupViewModel()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        //self.fetchInsuranceInfo()
    }
    
    func setUpUI(){
        
        totalRewardPointView.addBorderAndColor(color: APPConstants.Colors.BORDER_COLOR, width: 0.0, corner_radius: 5.0, clipsToBounds: true)
        pointWorthView.addBorderAndColor(color: APPConstants.Colors.BORDER_COLOR, width: 0.0, corner_radius: 5.0, clipsToBounds: true)
        submitButton.addBorderAndColor(color: APPConstants.Colors.BORDER_COLOR, width: 0.0, corner_radius: 5.0, clipsToBounds: true)
        redeemDesciptionLabel.attributedText = APPConstants.RedeemPointsScreen.Description_RedeemPoints.htmlToAttributedStringTest
        redeemDesciptionLabel.font = UIFont.systemFont(ofSize: 16.0)
        
        self.notPurchasedLabel.text = ""
        self.totalRewardLabel.text = "\(totalPoints)"
        let points = Double(pointsValue)
        self.pointWorthLabel.text! = String(format: "₹ %.2f", points)

        if isRedeemBlocked {
            self.submitButton.isUserInteractionEnabled = false
            self.submitButton.backgroundColor = UIColor.lightGray
        } else {
            self.submitButton.isUserInteractionEnabled = true
            self.submitButton.backgroundColor = APPConstants.Colors.BUTTON_BG_COLOR
        }
        
    }
    
    func setUpData(){
        /*if (viewModel.userPolicyModel?.userPolicy?.count ?? 0) > 0 {
            self.notPurchasedLabel.text = ""
            if let policies = viewModel.userPolicyModel?.userPolicy {
                
                for policy in policies {
                    if let premium = policy.premium {
                        totalPoints += Int(premium) ?? 0
                    }
                }
            }
            self.totalRewardLabel.text = "\(totalPoints)"
            let points = (Double(totalPoints) * 0.03)
            self.pointWorthLabel.text! = String(format: "₹ %.2f", points)
            //self.pointWorthLabel.text = "₹ \(Double(totalPoints) * 0.03)"
        } else {
            self.notPurchasedLabel.text = APPConstants.RedeemPointsScreen.NO_POLICY_TEXT
            self.totalRewardLabel.text = "\(totalPoint)"
            self.pointWorthLabel.text = "₹ \(Double(totalPoint) * 0.03)"
        }
        */
        
    }
    
    func fetchInsuranceInfo(){
        guard let requestUrl = URL(string: APPConstants.APIPath.getUserInsuranceInfo) else {
           return
        }
        
        let userModel = OPTUtilities.sharedInstance.getUserData()
        let requestParam : [String: String] = ["mobileNumber": userModel.mobileNumber ?? ""]
        viewModel.bindGetUserInsuranceListData(requestUrl: requestUrl, parameters: requestParam)
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
        
        self.viewModel.didGetPolicyData = { [weak self] in
            self?.setUpData()
        }
        
       
        self.viewModel.didGetData = { [weak self] message in
            //print("message is\(message)")
            self?.showRedeemSubmitAlert(message: message)
        }
    }
    
    func showRedeemSubmitAlert(message: String){
        
        let alert = UIAlertController(title: "Message", message: message, preferredStyle: UIAlertController.Style.alert)

        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: { action in
            self.navigationController?.popViewController(animated: true)
        }))
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
    @IBAction func backButtonAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func submitButtonActn(_ sender: UIButton) {
        guard let requestUrl = URL(string: APPConstants.APIPath.redeemPoints) else {
           return
        }

        guard let inviteCode = UserDefaults.standard.value(forKey: "inviteCode") else {
            return
        }

        let requestParam : [String: String] = ["inviteCode": inviteCode as! String]

        viewModel.bindSubmitRedeemRewardPoints(requestUrl: requestUrl, parameters: requestParam)

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

extension String {
    var htmlToAttributedStringTest: NSAttributedString? {
        guard let data = data(using: .utf8) else { return nil }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return nil
        }
    }
    var htmlToStringTest: String {
        return htmlToAttributedStringTest?.string ?? ""
    }
}
