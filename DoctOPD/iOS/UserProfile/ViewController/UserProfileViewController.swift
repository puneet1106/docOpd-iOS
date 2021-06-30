//
//  UserProfileViewController.swift
//  DoctOPD (iOS)
//
//  Created by Puneet on 30/06/21.
//

import UIKit
import SVProgressHUD

class UserProfileViewController: UIViewController {

    @IBOutlet weak var insurancePoliciesSectionView: UIView!
    @IBOutlet weak var backgroundInfoView: UIView!
    @IBOutlet var tableView: UITableView!
        
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userEmailLabel: UILabel!
    @IBOutlet weak var userMobileNumberLabel: UILabel!
    var userModel: User?
    var viewModel = UserProfileViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        //tableView.rowHeight = UITableView.automaticDimension
        // Register the xib for tableview cell
       
        setUpUI()
        setupViewModel()
        fetchInsuranceInfo()
    }
    
    func setUpUI(){
        
        tableView.separatorStyle = .none
        let cellNib = UINib(nibName: "PolicyDetailCell", bundle: nil)
        self.tableView.register(cellNib, forCellReuseIdentifier: "PolicyDetailCell")
        
        backgroundInfoView.layer.cornerRadius = 65
        backgroundInfoView.layer.maskedCorners = [.layerMaxXMaxYCorner]
        
        userModel = OPTUtilities.sharedInstance.getUserData()
        userNameLabel.text = userModel?.name
        userEmailLabel.text = userModel?.email
        userMobileNumberLabel.text = userModel?.mobileNumber
        
        insurancePoliciesSectionView.addBorderAndColor(color: APPConstants.Colors.BORDER_COLOR, width: 1.0, corner_radius: 5.0, clipsToBounds: true)
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
        
    
        self.viewModel.didGetUserInsuranceListData = { [weak self] in
            if self?.viewModel.model?.status == 200 {
                self?.tableView.reloadData()
            }
        }
    }
    
    func fetchInsuranceInfo(){
        guard let requestUrl = URL(string: APPConstants.APIPath.getUserInsuranceInfo) else {
           return
        }
        
        let requestParam : [String: String] = ["mobileNumber": userModel?.mobileNumber ?? ""]
        viewModel.bindGetUserInsuranceListData(requestUrl: requestUrl, parameters: requestParam)
    }
    
    
    @IBAction func backButtonActn(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
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

extension UserProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
       // return colorsArray.objectsArray.count
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return colorsArray.objectsArray[section].subcategory.count
        return self.viewModel.model?.userPolicy?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
        
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "PolicyDetailCell", for: indexPath) as? PolicyDetailCell {
                if let userPolicies = self.viewModel.model?.userPolicy {
                    cell.setPolicyData(data: userPolicies[indexPath.row])
                }
                cell.selectionStyle = .none
                cell.outerView.layer.cornerRadius = 5.0
                cell.outerView.layer.borderWidth = 1.0
                cell.outerView.layer.borderColor = APPConstants.Colors.CATEGORY_CELL_SHADOW_COLOR.cgColor
                cell.outerView.layer.masksToBounds = true

                cell.outerView.layer.backgroundColor = UIColor.white.cgColor
                cell.outerView.layer.shadowColor = APPConstants.Colors.CATEGORY_CELL_SHADOW_COLOR.cgColor
                cell.outerView.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
                cell.outerView.layer.shadowRadius = 2.0
                cell.outerView.layer.shadowOpacity = 1.0
                cell.outerView.layer.masksToBounds = false
                
                return cell
           }
        }
    
        return UITableViewCell()
    }

    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
}


