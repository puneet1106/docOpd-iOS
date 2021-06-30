//
//  WelcomeCell.swift
//  DoctOPD (iOS)
//
//  Created by Puneet on 26/06/21.
//


import UIKit
import SDWebImage

protocol CollectionViewCellDelegate: class {
    func collectionView(collectionviewcell: InfoCollectionViewCell?, index: Int, didTappedInTableViewCell: WelcomeCell)
    // other delegate methods that you can define to perform action in viewcontroller
}

class WelcomeCell: UITableViewCell {
    
    @IBOutlet weak var profileImageButton: UIButton!
    @IBOutlet weak var backgroundInfoView: UIView!
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!

    @IBOutlet weak var findDoctorButton: UIButton!
    weak var cellDelegate: CollectionViewCellDelegate?
    
    var inventoryData: [Inventory]?{
        didSet {
            self.collectionView.reloadData()
        }
    }
    /*var textArray = [APPConstants.HomeInsuranceScreenInfoSection.insurance_txt,APPConstants.HomeInsuranceScreenInfoSection.banner1,APPConstants.HomeInsuranceScreenInfoSection.banner2,APPConstants.HomeInsuranceScreenInfoSection.banner3,APPConstants.HomeInsuranceScreenInfoSection.banner4,APPConstants.HomeInsuranceScreenInfoSection.banner5]*/
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = UIColor.clear
        
        // TODO: need to setup collection view flow layout
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
       // flowLayout.itemSize = CGSize(width: 150, height: 180)
        flowLayout.itemSize = CGSize(width: self.collectionView.frame.width, height: self.collectionView.frame.width / 2 - 10)
        flowLayout.minimumLineSpacing = 0.0
        //flowLayout.minimumInteritemSpacing = 5.0
        self.collectionView.collectionViewLayout = flowLayout
        self.collectionView.showsHorizontalScrollIndicator = false
        self.collectionView.isPagingEnabled = true
        
        
        // Comment if you set Datasource and delegate in .xib
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        // Register the xib for collection view cell
        let cellNib = UINib(nibName: "InfoCollectionViewCell", bundle: nil)
        self.collectionView.register(cellNib, forCellWithReuseIdentifier: "InfoCollectionViewCell")
        
        backgroundInfoView.layer.cornerRadius = 25
        backgroundInfoView.layer.maskedCorners = [.layerMaxXMaxYCorner]
        
        pageControl.backgroundStyle = .minimal
        pageControl.numberOfPages = 3
        pageControl.isUserInteractionEnabled = false
        pageControl.frame = CGRect(x: (self.contentView.frame.width - 500)/2, y: self.contentView.frame.height - 20, width: 500, height: 20)
        self.contentView.addSubview(pageControl)
        self.pageControl.pageIndicatorTintColor =  UIColor.systemGray2
        pageControl.currentPageIndicatorTintColor = APPConstants.Colors.BUTTON_BG_COLOR
        startTimer()
    }
    
    func startTimer() {

        _ =  Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(self.scrollAutomatically), userInfo: nil, repeats: true)
    }


    @objc func scrollAutomatically(_ timer1: Timer) {

        if let coll  = collectionView {
            for cell in coll.visibleCells {
                let indexPath: IndexPath? = coll.indexPath(for: cell)
                if ((indexPath?.row)! < (self.inventoryData?.count ?? 0)){
                    let indexPath1: IndexPath?
                    indexPath1 = IndexPath.init(row: (indexPath?.row)! + 1, section: (indexPath?.section)!)

                    coll.scrollToItem(at: indexPath1!, at: .right, animated: true)
                    pageControl.currentPage = indexPath1?.row ?? 0
                    
                    if (indexPath1?.row ?? 0) >= (self.inventoryData?.count ?? 0) {
                        pageControl.currentPage = 0
                    }
                }
                else{
                    let indexPath1: IndexPath?
                    indexPath1 = IndexPath.init(row: 0, section: (indexPath?.section)!)
                    coll.scrollToItem(at: indexPath1!, at: .left, animated: true)
                    pageControl.currentPage = 0
                    print("current page left is \(pageControl.currentPage)")

                }

            }
        }
    }
}

extension WelcomeCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as? InfoCollectionViewCell
        print("I'm tapping the \(indexPath.item)")
        self.cellDelegate?.collectionView(collectionviewcell: cell, index: indexPath.item, didTappedInTableViewCell: self)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.pageControl.numberOfPages = inventoryData?.count ?? 0
        return inventoryData?.count ?? 0
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    // Set the data for each cell (color and color name)
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "InfoCollectionViewCell", for: indexPath) as? InfoCollectionViewCell {
           /* if indexPath.row == 0 {
                cell.healthInsuranceView.isHidden = false
                cell.infoView.isHidden = true
                cell.insuranceInfoLabel.text = inventoryData
            } else {*/
                cell.healthInsuranceView.isHidden = true
                cell.infoView.isHidden = false
            
            cell.infoLabel.text = inventoryData?[indexPath.row].description
            let imageUrl = URL(string: APPConstants.APIPath.inventoryImagePathURL + (inventoryData?[indexPath.row].image ?? ""))
            cell.backgroundImageView.sd_setImage(with: imageUrl, completed: nil)
            //}
            return cell
        }
        return UICollectionViewCell()
    }
    
    // Add spaces at the beginning and the end of the collection view
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
           return 20
       }

       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
           return CGSize(width: collectionView.frame.size.width - 20, height: collectionView.frame.size.height)
       }

    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if collectionView == self.collectionView {
              if pageControl.currentPage == indexPath.row {
                guard let visible = self.collectionView.visibleCells.first else { return }
                guard let index = self.collectionView.indexPath(for: visible)?.row else { return }
                  pageControl.currentPage = index
              }

          }
    }
}

