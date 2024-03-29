//
//  HomeViewController.swift
//  DoctOPD (iOS)
//
//  Created by Puneet on 26/06/21.
//

import UIKit
import SVProgressHUD

class HomeViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
        
    var viewModel = HomeViewModel()
    var isCategoryListHidden: Bool = true
    var selectedTabIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = .none
        let cellNib = UINib(nibName: "WelcomeCell", bundle: nil)
        self.tableView.register(cellNib, forCellReuseIdentifier: "WelcomeCell")
        self.tableView.register(UINib(nibName: "CategoryCell", bundle: nil), forCellReuseIdentifier: "CategoryCell")
        self.tableView.register(UINib(nibName: "ShortlistedDoctorCell", bundle: nil), forCellReuseIdentifier: "ShortlistedDoctorCell")
        self.tableView.register(UINib(nibName: "AboutDoctOPDCell", bundle: nil), forCellReuseIdentifier: "AboutDoctOPDCell")
        setupViewModel()
        fetchBannerList()
        fetchCategoryList()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        fetchShortlistedDoctor()
        
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
        
        self.viewModel.didGetBannerListData = { [weak self] in
            if self?.viewModel.bannerModel?.status == 200 {
                self?.tableView.reloadData()
            }
        }
        
        self.viewModel.didGetCategoryListData = { [weak self] in
            if self?.viewModel.model?.status == 200 {
                CategoryListData.sharedInstance.categoryList = self?.viewModel.model?.category
                self?.tableView.reloadData()
            }
        }
        
        self.viewModel.didGetShortlistDoctorData = { [weak self] in
            if self?.viewModel.shortlistDoctorListModel?.status == 200 {
                self?.tableView.reloadData()
            }
        }
        
    
    }
    
    func openWebViewScreen(title: String, urlStr: String) {
        let storyboard : UIStoryboard   =   UIStoryboard(name: APPConstants.StoryboardIdentifiers.MORE, bundle: nil)
        let vc  =   storyboard.instantiateViewController(withIdentifier: APPConstants.TermsConditionScreen.TermsCondition_Controller) as! TermsCondition_VC
        vc.openUrl  =   urlStr
        vc.navigationtitle  = title
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func fetchBannerList(){
        guard let requestUrl = URL(string: APPConstants.APIPath.getBannerList) else {
           return
        }
        
        let requestParam : [String: String] = [:]
        viewModel.bindGetBannerListData(requestUrl: requestUrl, parameters: requestParam)
    }
    
    func fetchCategoryList(){
        guard let requestUrl = URL(string: APPConstants.APIPath.getCategoryList) else {
           return
        }
        
        let requestParam : [String: String] = [:]
        viewModel.bindGetCategoryListData(requestUrl: requestUrl, parameters: requestParam)
    }
    
    func fetchShortlistedDoctor(){
        guard let requestUrl = URL(string: APPConstants.APIPath.getShortlistedDoctorList) else {
           return
        }
        
        if let userId = UserDefaults.standard.value(forKey: "userId"){
            let requestParam : [String: String] = ["userId": "\(userId)"]
            viewModel.bindGetShortlistedDoctorList(requestUrl: requestUrl, parameters: requestParam)
        }
    }

    @objc func switchToSearchTab() {
        self.tabBarController?.selectedIndex = 1
    }
    
    @objc func navigateToProfile() {
        let storyboard = UIStoryboard(name: APPConstants.StoryboardIdentifiers.PROFILE, bundle: nil)
        let newView = storyboard.instantiateViewController(withIdentifier: APPConstants.ProfileScreen.USER_INFO_SCREEN) as! UserProfileViewController
        self.navigationController?.pushViewController(newView, animated: true)
        
    }
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
       // return colorsArray.objectsArray.count
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return colorsArray.objectsArray[section].subcategory.count
        if section == 2 {
            return self.viewModel.shortlistDoctorListModel?.shortlistDoctors?.count ?? 0
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0{
            return 290.0
        } else if indexPath.section == 1{
        if isCategoryListHidden {
            return 220.0
        }
        let numberOfRows = (viewModel.model?.category?.count ?? 0) / 30
            return ((200.0) * CGFloat(numberOfRows))
        } else if indexPath.section == 2 {
            return 100.0
        }
        return 647.0
    }
    
    // Category Title
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 2 {
        let headerView = UIView()
        headerView.backgroundColor = .white
        let titleLabel = UILabel(frame: CGRect(x: 10, y: 0, width: 200, height: 44))
        headerView.addSubview(titleLabel)
        titleLabel.textColor = UIColor.black
        titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        titleLabel.text = "Top Rated Doctors"
        return headerView
        } else if section == 3 {
            let headerView = UIView()
            headerView.backgroundColor = .white
            let titleLabel = UILabel(frame: CGRect(x: 10, y: 0, width: 200, height: 44))
            headerView.addSubview(titleLabel)
            titleLabel.textColor = UIColor.black
            titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
            titleLabel.text = "About DoctOPD"
            return headerView
            }
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 2 ||  section == 3{
            return 44.0
        }
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "WelcomeCell", for: indexPath) as? WelcomeCell {
                cell.cellDelegate = self
                cell.inventoryData = self.viewModel.bannerModel?.inventory ?? []
                cell.selectionStyle = .none
                cell.findDoctorButton.addTarget(self, action: #selector(switchToSearchTab), for: .touchUpInside)
                cell.profileImageButton.addTarget(self, action: #selector(navigateToProfile), for: .touchUpInside)
                return cell
           }
        } else if indexPath.section == 1 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath) as? CategoryCell {
                cell.selectionStyle = .none
                cell.cellDelegate = self
                cell.setUpCategoryData(data: viewModel.model?.category, isCategoryListHidden: self.isCategoryListHidden)
                return cell
           }
        } else if indexPath.section == 2 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "ShortlistedDoctorCell", for: indexPath) as? ShortlistedDoctorCell {
                cell.selectionStyle = .none
                cell.cellDelegate = self
                if let doctors = viewModel.shortlistDoctorListModel?.shortlistDoctors {
                    if doctors.count > 0 {
                        cell.setUpUI(doctorInfo: doctors[indexPath.row])
                    }
                }
                return cell
            }
            
        } else if indexPath.section == 3 {
                if let cell = tableView.dequeueReusableCell(withIdentifier: "AboutDoctOPDCell", for: indexPath) as? AboutDoctOPDCell {
                    cell.selectionStyle = .none
                    cell.layoutIfNeeded()

                    let storyboard = UIStoryboard(name: APPConstants.StoryboardIdentifiers.ONBOARDING, bundle: Bundle.main)
                    let pageControlVC = storyboard.instantiateViewController(withIdentifier: APPConstants.OnboardingScreen.PAGE_CONTROL_SCREEN)
                    self.addChild(pageControlVC)
                    cell.pagingView.addSubview(pageControlVC.view)
                    pageControlVC.didMove(toParent: self)
                   // vc.view.layoutIfNeeded()
                    return cell
            }
          }
        
        return UITableViewCell()
    }

    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
}

extension HomeViewController: CollectionViewCellDelegate {
    func collectionView(collectionviewcell: InfoCollectionViewCell?, index: Int, didTappedInTableViewCell: WelcomeCell) {
        if let urlStr = self.viewModel.bannerModel?.inventory?[index].url {
            self.openWebViewScreen(title: "", urlStr: urlStr)
        }
    }
}


extension HomeViewController: CategoryCellDelegate {
    func didTapSeeAll(isHide: Bool) {
        if isHide {
            isCategoryListHidden = true
        } else {
            isCategoryListHidden = false
        }
        
        self.tableView.reloadSections(NSIndexSet(index: 1) as IndexSet, with: .none)

    }
    
    func categoryCollectionView(collectionviewcell: CategoryCollectionCell?, index: Int, didTappedInTableViewCell: CategoryCell) {
        if let controller = self.tabBarController?.viewControllers?[1] as? UINavigationController{
            
            if let searchController = controller.children.first as? SearchDoctorViewController {
                searchController.selectedCategory = self.viewModel.model?.category?[index].name ?? ""
                self.tabBarController?.selectedIndex = 1
            }
                        
        }

    }
}

extension HomeViewController: ShortListedDoctorCellDelegate {
    func selectedDoctorTapped(profileId: Int) {
        self.navigateToDoctorInfoScreen(profileId: profileId)
    }
    
    func navigateToDoctorInfoScreen(profileId: Int){
        let storyboard = UIStoryboard(name: APPConstants.StoryboardIdentifiers.PROFILE, bundle: nil)
        let newView = storyboard.instantiateViewController(withIdentifier: APPConstants.ProfileScreen.DOCTOR_INFO_SCREEN) as! DoctorProfileViewController
        newView.doctorId = profileId
        newView.isShortlistedDoctor = true
        self.navigationController?.pushViewController(newView, animated: true)
    }
}
