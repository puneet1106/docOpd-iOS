//
//  SearchCategoryCell.swift
//  DoctOPD (iOS)
//
//  Created by Puneet on 29/06/21.
//



import UIKit

protocol SearchCategoryCellDelegate: class {
    func collectionView(collectionviewcell: SearchCategoryCollectionViewCell?, index: Int, didTappedInTableViewCell: SearchCategoryCell)
    // other delegate methods that you can define to perform action in viewcontroller
}

class SearchCategoryCell: UITableViewCell {
    
    weak var cellDelegate: SearchCategoryCellDelegate?
    
    @IBOutlet var collectionView: UICollectionView!
  
    var categoryList = [CategoryItem]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = UIColor.clear
        
        // TODO: need to setup collection view flow layout
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
       // flowLayout.itemSize = CGSize(width: 150, height: 180)
        flowLayout.itemSize = CGSize(width: 140.0, height: 80.0)
        flowLayout.minimumLineSpacing = 0.0
        //flowLayout.minimumInteritemSpacing = 5.0
        self.collectionView.collectionViewLayout = flowLayout
        self.collectionView.showsHorizontalScrollIndicator = false
        self.collectionView.isPagingEnabled = false
        
        
        // Comment if you set Datasource and delegate in .xib
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        // Register the xib for collection view cell
        let cellNib = UINib(nibName: "SearchCategoryCollectionViewCell", bundle: nil)
        self.collectionView.register(cellNib, forCellWithReuseIdentifier: "SearchCategoryCollectionViewCell")
        
    }
    
    func setUpCategoryData(data: [CategoryItem]?){
        self.categoryList = data ?? []
        self.collectionView.reloadData()
       // self.collectionView.collectionViewLayout.invalidateLayout()
        //self.collectionView.layoutSubviews()
    }

}

extension SearchCategoryCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as? SearchCategoryCollectionViewCell
        print("I'm tapping the \(indexPath.item)")
        self.cellDelegate?.collectionView(collectionviewcell: cell, index: indexPath.item, didTappedInTableViewCell: self)
        //self.cellDelegate?.collectionView(collectionviewcell: cell, index: indexPath.item, didTappedInTableViewCell: self)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if self.categoryList.count > 0{
            return self.categoryList.count
        }
        return 0
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    // Set the data for each cell (color and color name)
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchCategoryCollectionViewCell", for: indexPath) as? SearchCategoryCollectionViewCell {
            cell.categoryLabel.text = self.categoryList[indexPath.row].name
            
            cell.outerView.layer.cornerRadius = 5.0
            cell.outerView.layer.borderWidth = 1.0
            cell.outerView.layer.masksToBounds = true
            return cell
        }
        return UICollectionViewCell()
    }
    
    // Add spaces at the beginning and the end of the collection view
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
           return 10
       }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 10.0
//    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:140.0 , height: 80.0)
    }

}

