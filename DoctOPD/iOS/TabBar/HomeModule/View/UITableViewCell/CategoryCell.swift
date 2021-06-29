//
//  CategoryCell.swift
//  DoctOPD (iOS)
//
//  Created by Puneet on 26/06/21.
//

import UIKit

protocol CategoryCellDelegate: class {
    func didTapSeeAll(isHide: Bool)
    func categoryCollectionView(collectionviewcell: CategoryCollectionCell?, index: Int, didTappedInTableViewCell: CategoryCell)

    // other delegate methods that you can define to perform action in viewcontroller
}

class CategoryCell: UITableViewCell {
    
    weak var cellDelegate: CategoryCellDelegate?
    var isCategoryListHidden: Bool = true
    
    @IBOutlet weak var seeAllButton: UIButton!
    @IBOutlet var collectionView: UICollectionView!
  
    var categoryList = [CategoryItem]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = UIColor.clear
        
        // TODO: need to setup collection view flow layout
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
       // flowLayout.itemSize = CGSize(width: 150, height: 180)
        flowLayout.itemSize = CGSize(width: 120, height: 160)
        flowLayout.minimumLineSpacing = 0.0
        //flowLayout.minimumInteritemSpacing = 5.0
        self.collectionView.collectionViewLayout = flowLayout
        self.collectionView.showsHorizontalScrollIndicator = false
        self.collectionView.isPagingEnabled = false
        
        
        // Comment if you set Datasource and delegate in .xib
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        // Register the xib for collection view cell
        let cellNib = UINib(nibName: "CategoryCollectionCell", bundle: nil)
        self.collectionView.register(cellNib, forCellWithReuseIdentifier: "CategoryCollectionCell")
        
    }
    
    func setUpCategoryData(data: [CategoryItem]?, isCategoryListHidden: Bool){
        self.categoryList = data ?? []
        self.isCategoryListHidden = isCategoryListHidden
        self.collectionView.reloadData()
        self.collectionView.collectionViewLayout.invalidateLayout()
        self.collectionView.layoutSubviews()
    }

    @IBAction func seeAllClicked(_ sender: UIButton) {
        if isCategoryListHidden {
            cellDelegate?.didTapSeeAll(isHide: false)
            isCategoryListHidden = false
            sender.setTitle("See All", for: .normal)
        } else {
            cellDelegate?.didTapSeeAll(isHide: true)
            isCategoryListHidden = true
            sender.setTitle("Hide", for: .normal)
        }
    }
}

extension CategoryCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as? CategoryCollectionCell
        print("I'm tapping the \(indexPath.item)")
        self.cellDelegate?.categoryCollectionView(collectionviewcell: cell, index: indexPath.item, didTappedInTableViewCell: self)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if self.categoryList.count > 0{
            if self.isCategoryListHidden {
                return 6
            }
            return self.categoryList.count
        }
        return 0
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    // Set the data for each cell (color and color name)
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionCell", for: indexPath) as? CategoryCollectionCell {
            cell.categoryLabel.text = self.categoryList[indexPath.row].name
            let nameArray = self.categoryList[indexPath.row].name?.components(separatedBy: " ")
            if nameArray?.count ?? 0 > 1 {
                let name = nameArray?.joined(separator: "-")
                if let imgPath = Bundle.main.path(forResource: name, ofType: ".jpg")
                {
                    cell.backgroundImageView.image = UIImage(contentsOfFile: imgPath)
                }
            } else {
                let name = self.categoryList[indexPath.row].name
                if let imgPath = Bundle.main.path(forResource: name, ofType: ".jpg")
                {
                    cell.backgroundImageView.image = UIImage(contentsOfFile: imgPath)
                }
            }
            
            cell.outerView.layer.cornerRadius = 5.0
            cell.outerView.layer.borderWidth = 1.0
            cell.outerView.layer.borderColor = UIColor.clear.cgColor
            cell.outerView.layer.masksToBounds = true

            cell.layer.backgroundColor = UIColor.white.cgColor
            cell.layer.shadowColor = APPConstants.Colors.CATEGORY_CELL_SHADOW_COLOR.cgColor
            cell.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
            cell.layer.shadowRadius = 2.0
            cell.layer.shadowOpacity = 1.0
            cell.layer.masksToBounds = false
            return cell
        }
        return UICollectionViewCell()
    }
    
    // Add spaces at the beginning and the end of the collection view
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 10, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
           return 20
       }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20.0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:120.0 , height: 170.0)
    }

}

