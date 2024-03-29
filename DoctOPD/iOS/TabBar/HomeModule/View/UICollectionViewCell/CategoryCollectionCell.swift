//
//  CategoryCollectionCell.swift
//  DoctOPD (iOS)
//
//  Created by Puneet on 26/06/21.
//


import UIKit

class CategoryCollectionCell: UICollectionViewCell {

    
    @IBOutlet weak var outerView: UIView!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        outerView.addBorderAndColor(color: UIColor.clear, width: 0.0, corner_radius: 5.0, clipsToBounds: true)
    // Initialization code
    }
    
}
