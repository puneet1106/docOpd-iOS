//
//  SearchDoctorListCell.swift
//  DoctOPD (iOS)
//
//  Created by Puneet on 29/06/21.
//

import UIKit
import SDWebImage

protocol DoctorCellDelegate: class {
    func selectedSearchDoctorTapped(profileId: Int)
    // other delegate methods that you can define to perform action in viewcontroller
}

class SearchDoctorListCell: UITableViewCell {

    @IBOutlet weak var outerView: UIView!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var doctorName: UILabel!
    @IBOutlet weak var doctorQualification: UILabel!
    @IBOutlet weak var doctorAddress: UILabel!

    
    weak var cellDelegate: DoctorCellDelegate?
    var profileId: Int = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        profileImageView.addBorderAndColor(color: .clear, width: 0.0, corner_radius: profileImageView.frame.width/2.0, clipsToBounds: true)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUpUI(doctorInfo: DoctorProfile){
        let imageURL = URL(string: APPConstants.APIPath.doctorImagePathURL + (doctorInfo.image ?? ""))
        profileImageView.sd_setImage(with: imageURL, completed: nil)
        doctorName.text = doctorInfo.name
        doctorQualification.text = doctorInfo.qualification
        doctorAddress.text = doctorInfo.clinicAddress?.first?.address ?? ""
        self.profileId = doctorInfo.profileId ?? 0
    }
    
    @IBAction func selectedDoctorActn(_ sender: UIButton) {
        cellDelegate?.selectedSearchDoctorTapped(profileId: self.profileId)
    }
    
}
