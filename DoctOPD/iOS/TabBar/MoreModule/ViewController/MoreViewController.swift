//
//  HomeVC.swift
//  AKSwiftSlideMenu
//
//  Created by MAC-186 on 4/8/16.
//  Copyright © 2016 Kode. All rights reserved.
//

import UIKit
import SVProgressHUD

class MoreViewController: UIViewController {
    
    @IBOutlet weak var moreTableView: UITableView!
    
    var viewModel = MoreViewModel()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        moreTableView.separatorStyle = .none
        
        let cellNib = UINib(nibName: "MoreCell", bundle: nil)
        self.moreTableView.register(cellNib, forCellReuseIdentifier: "MoreCell")
        self.moreTableView.register(UINib(nibName: "UserProflieHeaderView", bundle: nil), forHeaderFooterViewReuseIdentifier: "UserProflieHeaderView")

        setupViewModel()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.navigationBar.isHidden = true
        self.tabBarController?.tabBar.isHidden = false
        fetchUserPoints()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
                self?.moreTableView.reloadData()
            }
        }
        
    
    }
    
    func fetchUserPoints(){
        guard let requestUrl = URL(string: APPConstants.APIPath.getUserPoints) else {
           return
        }
        
        guard let inviteCode = UserDefaults.standard.value(forKey: "inviteCode") else {
            return
        }

        
        let requestParam : [String: String] = ["inviteCode": inviteCode as! String]
        viewModel.bindGetUserPointsData(requestUrl: requestUrl, parameters: requestParam)
    }
    
    func goToTermsConditionVC(title: String, urlStr: String) {
        let storyboard : UIStoryboard   =   UIStoryboard(name: APPConstants.StoryboardIdentifiers.MORE, bundle: nil)
        let vc  =   storyboard.instantiateViewController(withIdentifier: APPConstants.TermsConditionScreen.TermsCondition_Controller) as! TermsCondition_VC
        vc.openUrl  =   urlStr
        vc.navigationtitle  = title
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func goToInviteScreen() {
        let storyboard : UIStoryboard   =   UIStoryboard(name: APPConstants.StoryboardIdentifiers.MORE, bundle: nil)
        let vc  =   storyboard.instantiateViewController(withIdentifier: APPConstants.InViteFriendScreen.INVITEFRIENDS_Controller) as! InviteFriendsViewController
        if viewModel.model?.redeemBlocked == true {
            vc.isInviteSectionShow = false
        } else {
            vc.isInviteSectionShow = true
        }
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func goToRedeemPointsScreen() {
        let storyboard : UIStoryboard   =   UIStoryboard(name: APPConstants.StoryboardIdentifiers.MORE, bundle: nil)
        let vc  =   storyboard.instantiateViewController(withIdentifier: APPConstants.RedeemPointsScreen.REDEEDM_POINTS_SCREEN) as! RedeemPointsViewController
        vc.totalPoint = viewModel.model?.totalPoints ?? 0
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func goToSignInScreen() {
        UserDefaults.standard.removePersistentDomain(forName: Bundle.main.bundleIdentifier ?? "DoctOPD.DoctOPD")
        UserDefaults.standard.synchronize()
        let storyboard = UIStoryboard(name: APPConstants.StoryboardIdentifiers.SIGNUP, bundle: nil)
        let initialViewController = storyboard.instantiateViewController(withIdentifier: "SignInViewController") as! SignInViewController
        let nvc: UINavigationController = UINavigationController(rootViewController: initialViewController)
       nvc.setNavigationBarHidden(true, animated: false)
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = nvc
    }

    @objc func goToProfileScreen() {
        let storyboard = UIStoryboard(name: APPConstants.StoryboardIdentifiers.PROFILE, bundle: nil)
        let newView = storyboard.instantiateViewController(withIdentifier: APPConstants.ProfileScreen.USER_INFO_SCREEN) as! UserProfileViewController
        self.navigationController?.pushViewController(newView, animated: true)
    }
}

extension MoreViewController: UITableViewDelegate, UITableViewDataSource {
    
    
     func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "UserProflieHeaderView") as! UserProflieHeaderView
         let userModel = OPTUtilities.sharedInstance.getUserData()
         headerView.emailLabel.text = userModel.email
         headerView.nameLabel.text = userModel.name
        headerView.profileButtonClicked.addTarget(self, action: #selector(goToProfileScreen), for: .touchUpInside)
        headerView.pointsLabel.text = String(self.viewModel.model?.totalPoints ?? 0)
        

        return headerView
    }

     func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 210.0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
       // return colorsArray.objectsArray.count
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return colorsArray.objectsArray[section].subcategory.count
        return 9
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "MoreCell", for: indexPath) as? MoreCell {
                cell.selectionStyle = .none
                cell.setMoreItemData(index: indexPath.row)
                return cell
           }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            self.tabBarController?.selectedIndex = 0
            break
        case 1:
            self.tabBarController?.selectedIndex = 1
            break
        case 2:
            self.tabBarController?.selectedIndex = 2
            break
        case 3:
            self.goToRedeemPointsScreen()
            break
        case 4:
            self.goToInviteScreen()
            break
        case 5:
            self.goToTermsConditionVC(title: APPConstants.SignUpScreen.Privacy_Policy_Text, urlStr:APPConstants.APIPath.privacyPolicyURL)
            break
        case 6:
            self.goToTermsConditionVC(title: APPConstants.SignUpScreen.Terms_Conditions_Text, urlStr: APPConstants.APIPath.termsAndConditionsURL)
            break
        case 8:
            self.goToSignInScreen()
            break
        default:
             print("will done later")
        }
    }

    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
}


