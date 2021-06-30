//
//  PolicyDetailCell.swift
//  DoctOPD (iOS)
//
//  Created by Puneet on 30/06/21.
//

import UIKit

class PolicyDetailCell: UITableViewCell {

    @IBOutlet weak var policyName: UILabel!
    @IBOutlet weak var policyNumber: UILabel!
    @IBOutlet weak var renewalDateLabel: UILabel!
    @IBOutlet weak var insuredSumLabel: UILabel!
    @IBOutlet weak var outerView: UIView!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        outerView.addBorderAndColor(color: UIColor.clear, width: 0.0, corner_radius: 5.0, clipsToBounds: true)

        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setPolicyData(data: UserPolicy) {
        self.policyName.text = data.product ?? ""
        self.policyNumber.text = "(Policy No. \(data.policyNo ?? ""))"
        self.renewalDateLabel.text = (data.renewalDate ?? "") + ", " + (data.premium ?? "")
        self.insuredSumLabel.text = data.sumInsured ?? ""
    }
    
}
