//
//  MoreCell.swift
//  DoctOPD (iOS)
//
//  Created by Puneet on 04/07/21.
//

import UIKit

class MoreCell: UITableViewCell {

    @IBOutlet weak var itemTitle: UILabel!
    @IBOutlet weak var itemImage: UIImageView!

    let arrayItemsTitle = [APPConstants.MenuItemsTitle.home_title, APPConstants.MenuItemsTitle.find_doctor_title, APPConstants.MenuItemsTitle.emi_title, APPConstants.MenuItemsTitle.redeem_points_title, APPConstants.MenuItemsTitle.invite_title, APPConstants.MenuItemsTitle.aboutus_title, APPConstants.MenuItemsTitle.terms_title, APPConstants.MenuItemsTitle.settings_title, APPConstants.MenuItemsTitle.logout_title]
    
    let arrayItemsImage = [APPConstants.MenuItemsImage.home_menu_icon, APPConstants.MenuItemsImage.find_doctor_menu_icon, APPConstants.MenuItemsImage.emi_icon, APPConstants.MenuItemsImage.redeem_points_menu_icon, APPConstants.MenuItemsImage.invite_menu_icon, APPConstants.MenuItemsImage.aboutus_menu_icon, APPConstants.MenuItemsImage.terms_menu_icon, APPConstants.MenuItemsImage.settings_menu_icon, APPConstants.MenuItemsImage.logout_menu_icon]

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setMoreItemData(index: Int){
        self.itemTitle.text = arrayItemsTitle[index]
        self.itemImage.image = UIImage(named: arrayItemsImage[index])
    }

    
}

