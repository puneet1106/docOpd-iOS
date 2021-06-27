//
//  InfoCollectionViewCell.swift
//  DoctOPD (iOS)
//
//  Created by Puneet on 26/06/21.
//

import UIKit

class InfoCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var outerView: UIView!
    @IBOutlet weak var insuranceInfoLabel: UILabel!
    @IBOutlet weak var healthInsuranceView: UIView!
    @IBOutlet weak var infoView: UIView!
    @IBOutlet weak var yesButton: UIButton!
    @IBOutlet weak var noButton: UIButton!
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var infoLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        yesButton.addBorderAndColor(color: APPConstants.Colors.INSURANCE_BUTTON_BORDER_COLOR, width: 1.0, corner_radius: 15.0, clipsToBounds: true)
        noButton.addBorderAndColor(color: APPConstants.Colors.INSURANCE_BUTTON_BORDER_COLOR, width: 1.0, corner_radius: 15.0, clipsToBounds: true)
        outerView.addBorderAndColor(color: UIColor.clear, width: 0.0, corner_radius: 5.0, clipsToBounds: true)
    }

    @IBAction func yesButtonActn(_ sender: UIButton) {
        
    }
    
    @IBAction func noButtonActn(_ sender: UIButton) {
        
    }
    
}
