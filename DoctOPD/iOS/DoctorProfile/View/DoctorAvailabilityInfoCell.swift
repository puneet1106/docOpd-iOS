//
//  DoctorAvailabilityInfoCell.swift
//  DoctOPD (iOS)
//
//  Created by Puneet on 27/06/21.
//

import UIKit

class DoctorAvailabilityInfoCell: UITableViewCell {
    @IBOutlet weak var doctorAddressLabel: UILabel!
    @IBOutlet weak var doctorTimingLabel: UILabel!
    @IBOutlet weak var appointmentButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setDoctorAvailabilityData(doctorAddressInfo: ClinicAddress){
        let name = doctorAddressInfo.name ?? ""
        let address = doctorAddressInfo.address ?? ""
        let landmark = "Landmark : " + (doctorAddressInfo.landmark ?? "")
       
        self.doctorAddressLabel.text = name + "\n" + address + "\n" + landmark
        self.doctorTimingLabel.text = doctorAddressInfo.shiftTiming ?? ""

        
    }
}
