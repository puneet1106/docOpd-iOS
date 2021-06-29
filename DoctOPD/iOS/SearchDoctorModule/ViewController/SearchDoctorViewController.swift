//
//  SearchDoctorViewController.swift
//  DoctOPD (iOS)
//
//  Created by Puneet on 29/06/21.
//

import UIKit


import UIKit
import SVProgressHUD
import SDWebImage

class SearchDoctorViewController: UIViewController {
    
    @IBOutlet weak var searchDoctorListTableView: UITableView!
    @IBOutlet weak var searchTableViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var backgroundInfoView: UIView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var filterButton: UIButton!

    //    @IBOutlet weak var doctorProfileImageView: UIImageView!
    @IBOutlet var tableView: UITableView!
    @IBOutlet weak var totalDoctorsAvailableLabel: UILabel!
   
    //
    var viewModel = SearchDoctorViewModel()
    var categoryItems = [CategoryItem]()
    var selectedCategory = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = .none
        let cellNib = UINib(nibName: "SearchCategoryCell", bundle: nil)
        self.tableView.register(cellNib, forCellReuseIdentifier: "SearchCategoryCell")
        
        searchDoctorListTableView.separatorStyle = .none
        let searchDoctorCellNib = UINib(nibName: "SearchDoctorListCell", bundle: nil)
        self.searchDoctorListTableView.register(searchDoctorCellNib, forCellReuseIdentifier: "SearchDoctorListCell")
            
        
        setupViewModel()
        backgroundInfoView.layer.cornerRadius = 65
        backgroundInfoView.layer.maskedCorners = [.layerMaxXMaxYCorner]
        searchDoctorListTableView.isHidden = true
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        backButton.addBorderAndColor(color: UIColor.clear, width: 0.0, corner_radius: 0.5 * backButton.bounds.size.width, clipsToBounds: true)
        print("category count is \(categoryItems.count)")
        if selectedCategory != "" {
            self.fetchSearchDoctorList(categoryName: selectedCategory)
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
        
        self.viewModel.didGetSearchDoctorData = { [weak self] in
            if self?.viewModel.model?.status == 200 {
                self?.totalDoctorsAvailableLabel.text = "We have found \(self?.viewModel.model?.profiles?.count ?? 0) \(String(describing: self?.selectedCategory ?? ""))"
                self?.searchDoctorListTableView.isHidden = false
                self?.searchDoctorListTableView.reloadData()
                //self?.viewModel.model?.profiles?.count
            }
        }
        
        
    }
    
    func setUpUI(){
        //        self.doctorName.text = self.viewModel.model?.profile?.name
        //        self.doctorQualificationLabel.text = self.viewModel.model?.profile?.qualification
        //        let imageUrl = URL(string: APPConstants.APIPath.doctorImagePathURL + (self.viewModel.model?.profile?.image ?? ""))
        //        self.doctorProfileImageView.sd_setImage(with: imageUrl, completed: nil)
        //        self.doctorProfileImageView.addBorderAndColor(color: .clear, width: 0.0, corner_radius: self.doctorProfileImageView.frame.width / 2, clipsToBounds: true)
        //        let city = self.viewModel.model?.profile?.clinicAddress?.first?.city ?? ""
        //        let location = self.viewModel.model?.profile?.clinicAddress?.first?.location ?? ""
        //        let state = self.viewModel.model?.profile?.clinicAddress?.first?.state ?? ""
        //        self.doctorAddressLabel.text =  city + " " + location + " " + state
        
    }
    
    func fetchSearchDoctorList(categoryName: String){
        guard let requestUrl = URL(string: APPConstants.APIPath.findDoctors) else {
            return
        }
        //categoryId=1&location=Delhi
        let requestParam : [String: String] = ["category": categoryName, "location":"Delhi"]
        viewModel.bindGetDoctorSearchLitData(requestUrl: requestUrl, parameters: requestParam)
    }
    
    @IBAction func backButtonActn(_ sender: UIButton) {
        self.tabBarController?.selectedIndex = 0
    }
    
    @IBAction func filterButtonActn(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
            categoryItems.removeAll()
        } else {
            sender.isSelected = true
            categoryItems = CategoryListData.sharedInstance.categoryList ?? []
        }
        self.tableView.layoutIfNeeded()
        if categoryItems.count > 0 {
            let numberOfRows = categoryItems.count / 30
            self.searchTableViewHeightConstraint.constant = ((100.0) * CGFloat(numberOfRows))
        } else {
            self.searchTableViewHeightConstraint.constant = 0.0
            
        }
        
        self.tableView.reloadData()
        
    }
    
}


extension SearchDoctorViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // return colorsArray.objectsArray.count
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return colorsArray.objectsArray[section].subcategory.count
        if tableView == self.searchDoctorListTableView {
            return self.viewModel.model?.profiles?.count ?? 0
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == self.searchDoctorListTableView {
            return UITableView.automaticDimension
        }
        
        if categoryItems.count > 0 {
            let numberOfRows = categoryItems.count / 30
            return ((100.0) * CGFloat(numberOfRows))
        }
        
        return 0
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == self.searchDoctorListTableView {
            
            if let cell = tableView.dequeueReusableCell(withIdentifier: "SearchDoctorListCell", for: indexPath) as? SearchDoctorListCell {
                cell.selectionStyle = .none
                cell.cellDelegate = self
                if let doctorInfo = self.viewModel.model?.profiles?[indexPath.row] {
                    cell.setUpUI(doctorInfo: doctorInfo)
                }
                
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
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "SearchCategoryCell", for: indexPath) as? SearchCategoryCell {
            cell.selectionStyle = .none
            cell.cellDelegate = self
            cell.setUpCategoryData(data: categoryItems)
            return cell
        }
        return UITableViewCell()
    }
    
}

extension SearchDoctorViewController: SearchCategoryCellDelegate {
    func collectionView(collectionviewcell: SearchCategoryCollectionViewCell?, index: Int, didTappedInTableViewCell: SearchCategoryCell) {
        print("index is \(index)")
        self.searchDoctorListTableView.isHidden = true
        self.filterButtonActn(self.filterButton)
        self.selectedCategory = CategoryListData.sharedInstance.categoryList?[index].name ?? ""
        self.fetchSearchDoctorList(categoryName: CategoryListData.sharedInstance.categoryList?[index].name ?? "")
        
    }
}

extension SearchDoctorViewController: DoctorCellDelegate {
    func selectedSearchDoctorTapped(profileId: Int) {
        print("profile id is \(profileId)")
        self.navigateToDoctorInfoScreen(profileId: profileId)
    }
    
    func navigateToDoctorInfoScreen(profileId: Int){
        let storyboard = UIStoryboard(name: APPConstants.StoryboardIdentifiers.PROFILE, bundle: nil)
        let newView = storyboard.instantiateViewController(withIdentifier: APPConstants.ProfileScreen.DOCTOR_INFO_SCREEN) as! DoctorProfileViewController
        newView.doctorId = profileId
        self.navigationController?.pushViewController(newView, animated: true)
    }
}


