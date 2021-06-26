//
//  DoctorProfileViewController.swift
//  DoctOPD (iOS)
//
//  Created by Puneet on 27/06/21.
//


import UIKit
import SVProgressHUD
import SDWebImage

class DoctorProfileViewController: UIViewController {

    @IBOutlet weak var backgroundInfoView: UIView!
    @IBOutlet weak var doctorProfileImageView: UIImageView!
    @IBOutlet var tableView: UITableView!
        
    @IBOutlet weak var doctorName: UILabel!
    @IBOutlet weak var doctorQualificationLabel: UILabel!
    @IBOutlet weak var doctorAddressLabel: UILabel!
    
    var viewModel = DoctorProfileViewModel()
    var doctorId: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = .none
        //tableView.rowHeight = UITableView.automaticDimension
        // Register the xib for tableview cell
        let cellNib = UINib(nibName: "DoctorProfileDescriptionCell", bundle: nil)
        self.tableView.register(cellNib, forCellReuseIdentifier: "DoctorProfileDescriptionCell")
        
        self.tableView.register(UINib(nibName: "DoctorAvailabilityInfoCell", bundle: nil), forCellReuseIdentifier: "DoctorAvailabilityInfoCell")

        
        setupViewModel()
        backgroundInfoView.layer.cornerRadius = 65
        backgroundInfoView.layer.maskedCorners = [.layerMaxXMaxYCorner]
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        fetchDoctorInfo()
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
        
        self.viewModel.didGetDoctorInfoData = { [weak self] in
            if self?.viewModel.model?.status == 200 {
                self?.setUpUI()
                self?.tableView.reloadData()

            }
        }
    
    }
    
    func setUpUI(){
        self.doctorName.text = self.viewModel.model?.profile?.name
        self.doctorQualificationLabel.text = self.viewModel.model?.profile?.qualification
        let imageUrl = URL(string: APPConstants.APIPath.doctorImagePathURL + (self.viewModel.model?.profile?.image ?? ""))
        self.doctorProfileImageView.sd_setImage(with: imageUrl, completed: nil)
        self.doctorProfileImageView.addBorderAndColor(color: .clear, width: 0.0, corner_radius: self.doctorProfileImageView.frame.width / 2, clipsToBounds: true)
        let city = self.viewModel.model?.profile?.clinicAddress?.first?.city ?? ""
        let location = self.viewModel.model?.profile?.clinicAddress?.first?.location ?? ""
        let state = self.viewModel.model?.profile?.clinicAddress?.first?.state ?? ""
        self.doctorAddressLabel.text =  city + " " + location + " " + state
      
    }
    
    func fetchDoctorInfo(){
        guard let requestUrl = URL(string: APPConstants.APIPath.getDoctorInfo) else {
           return
        }
        
        let requestParam : [String: String] = ["id":"\(doctorId)"]
        viewModel.bindGetDoctorInfoData(requestUrl: requestUrl, parameters: requestParam)
    }
    
    @IBAction func backButtonActn(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}

extension DoctorProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
       // return colorsArray.objectsArray.count
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return colorsArray.objectsArray[section].subcategory.count
        let totalNumberOfRows = 1 + (self.viewModel.model?.profile?.clinicAddress?.count ?? 0)
        return totalNumberOfRows
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
        
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "DoctorProfileDescriptionCell", for: indexPath) as? DoctorProfileDescriptionCell {
                if let model = self.viewModel.model {
                    cell.setUpDoctorProfileDescription(model: model)
                }
                cell.selectionStyle = .none
                return cell
           }
        } else {
            
            if let cell = tableView.dequeueReusableCell(withIdentifier: "DoctorAvailabilityInfoCell", for: indexPath) as? DoctorAvailabilityInfoCell {
                if let model = self.viewModel.model {
                    if model.profile?.clinicAddress?.count ?? 0 > 0 {
                        cell.setDoctorAvailabilityData(doctorAddressInfo: (model.profile?.clinicAddress![indexPath.row - 1])!)
                    }
                }
                cell.selectionStyle = .none
                return cell
           }
            
        }
    
        return UITableViewCell()
    }

    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
}


