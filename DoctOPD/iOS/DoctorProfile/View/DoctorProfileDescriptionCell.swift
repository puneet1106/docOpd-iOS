//
//  DoctorProfileDescriptionCell.swift
//  DoctOPD (iOS)
//
//  Created by Puneet on 27/06/21.
//

import UIKit

class DoctorProfileDescriptionCell: UITableViewCell {

    @IBOutlet weak var specialitiesLabel: UILabel!
    @IBOutlet weak var experienceLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUpDoctorProfileDescription(model: DoctorProfileModel){
        if let category = model.profile?.category {
            self.specialitiesLabel.text = "  " + category + "  "
            self.specialitiesLabel.addBorderAndColor(color: .clear, width: 0.0, corner_radius: self.specialitiesLabel.frame.width/6, clipsToBounds: true)
        }
        self.experienceLabel.text = model.profile?.experience
        self.descriptionLabel.text = model.profile?.description
        
    }
}
