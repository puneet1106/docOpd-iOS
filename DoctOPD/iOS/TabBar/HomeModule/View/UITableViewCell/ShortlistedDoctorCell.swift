//
//  ShortlistedDoctorCell.swift
//  DoctOPD (iOS)
//
//  Created by Puneet on 26/06/21.
//

import UIKit
import SDWebImage

protocol ShortListedDoctorCellDelegate: class {
    func selectedDoctorTapped(profileId: Int)
    // other delegate methods that you can define to perform action in viewcontroller
}

class ShortlistedDoctorCell: UITableViewCell {

    @IBOutlet weak var outerView: UIView!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var doctorName: UILabel!
    @IBOutlet weak var doctorQualification: UILabel!

    
    weak var cellDelegate: ShortListedDoctorCellDelegate?
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
    
    func setUpUI(doctorInfo: ShortlistDoctors){
        let imageURL = URL(string: APPConstants.APIPath.doctorImagePathURL + (doctorInfo.image ?? ""))
        profileImageView.sd_setImage(with: imageURL, completed: nil)
        doctorName.text = doctorInfo.name
        doctorQualification.text = doctorInfo.qualification
        self.profileId = doctorInfo.profileId ?? 0
    }
    
    @IBAction func selectedDoctorActn(_ sender: UIButton) {
        cellDelegate?.selectedDoctorTapped(profileId: self.profileId)
    }
    
}
