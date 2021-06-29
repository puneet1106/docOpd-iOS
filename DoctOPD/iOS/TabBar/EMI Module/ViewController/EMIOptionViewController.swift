//
//  EMIOptionViewController.swift
//  DoctOPD (iOS)
//
//  Created by Puneet on 30/06/21.
//

import UIKit
import SVProgressHUD

class EMIOptionViewController: UIViewController {

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var confirmationButton: UIButton!
    
    var viewModel = EMIOptionViewModel()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        setupViewModel()
        // Do any additional setup after loading the view.
    }
    
    func setUpUI(){
        
        self.contentView.addBorderAndColor(color: .clear, width: 0.0, corner_radius: 5.0, clipsToBounds: true)
        self.confirmationButton.addBorderAndColor(color: .clear, width: 0.0, corner_radius: 5.0, clipsToBounds: true)

        
        let titleAttributes = [
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 30.0),
            NSAttributedString.Key.foregroundColor: APPConstants.Colors.INSURANCE_TITLE_COLOR
           ]
        
        let subtitleAttributes = [
               NSAttributedString.Key.font:  UIFont.boldSystemFont(ofSize: 19.0),
            NSAttributedString.Key.foregroundColor: APPConstants.Colors.INSURANCE_SUBTITLE_COLOR
           ]
        
        let descriptionAttributes = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16.0),
               NSAttributedString.Key.foregroundColor: UIColor.black
           ]
        
        let titleAttributedString = NSAttributedString(string:APPConstants.InsuranceTextScreen.Title_Insurance, attributes: titleAttributes)
        let subtitleAttributedString = NSAttributedString(string: APPConstants.InsuranceTextScreen.SubTitle_Insurance, attributes: subtitleAttributes)
        let descriptionAttributedString = NSAttributedString(string: APPConstants.InsuranceTextScreen.Description_Insurance, attributes: descriptionAttributes)
        
        let mutableAttributedString = NSMutableAttributedString()
        mutableAttributedString.append(titleAttributedString)
        mutableAttributedString.append(subtitleAttributedString)
        mutableAttributedString.append(descriptionAttributedString)
        contentLabel.attributedText = mutableAttributedString

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
                self?.navigateToInsuranceConfirmationScreen()
            }
        }
        
    }
    
    func navigateToInsuranceConfirmationScreen(){
        
        let storyboard = UIStoryboard(name: APPConstants.StoryboardIdentifiers.TABBAR, bundle: nil)
        let newView = storyboard.instantiateViewController(withIdentifier: APPConstants.InsuranceTextScreen.INSURANCE_CONFIRMATION_SCREEN) as! InsuranceConfirmationViewController
        self.navigationController?.pushViewController(newView, animated: true)
    }
    
    
    @IBAction func confirmationButtonActn(_ sender: UIButton) {
        guard let requestUrl = URL(string: APPConstants.APIPath.getUserConsent) else {
           return
        }
        
        if let userId = UserDefaults.standard.value(forKey: "userId"){
            let requestParam : [String: String] = ["userId": "\(userId)", "status": "1"]
            viewModel.bindGetUserConsent(requestUrl: requestUrl, parameters: requestParam)
        }
        
    }
    
    @IBAction func backButtonActn(_ sender: UIButton) {
        self.tabBarController?.selectedIndex = 0
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
