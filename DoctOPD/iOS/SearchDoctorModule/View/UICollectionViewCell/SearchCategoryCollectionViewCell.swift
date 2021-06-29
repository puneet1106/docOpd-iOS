//
//  SearchCategoryCollectionViewCell.swift
//  DoctOPD (iOS)
//
//  Created by Puneet on 29/06/21.
//


import UIKit

class SearchCategoryCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var outerView: UIView!
    @IBOutlet weak var categoryLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        outerView.addBorderAndColor(color: UIColor.clear, width: 0.0, corner_radius: 5.0, clipsToBounds: true)
        
        // Initialization code
    }
    
}
