//
//  PageControlViewController.swift
//  DoctOPD (iOS)
//
//  Created by Puneet on 22/06/21.
//

import UIKit

class PageControlViewController: UIViewController {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
         }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let tutorialPageViewController = segue.destination as? OnboardingPageViewController {
            tutorialPageViewController.tutorialDelegate = self
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
       
        pageControl.backgroundStyle = .minimal
        pageControl.numberOfPages = 3
        pageControl.isUserInteractionEnabled = false
        //self.pageControl.addTarget(self, action:#selector(didChangePage), for: UIControl.Event.touchUpInside)
       // self.pageControl.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        pageControl.frame = CGRect(x: (self.view.frame.width - 100)/2, y: self.view.frame.height - 20, width: 100, height: 20)
      //  pageControl.frame = CGRect(x: self.view.frame.width * 0.25, y: self.view.frame.height - 20, width: self.view.frame.width * 0.5, height: 20)
       // pageControl.sizeToFit()
        self.view.addSubview(pageControl)
        self.pageControl.pageIndicatorTintColor =  UIColor.systemGray2
        pageControl.currentPageIndicatorTintColor = APPConstants.Colors.BUTTON_BG_COLOR
//        self.pageControl.pageIndicatorTintColor =  UIColor(named: "GS-50")
//        pageControl.currentPageIndicatorTintColor = UIColor(named: "PB-100")
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension PageControlViewController: TutorialPageViewControllerDelegate {
    func tutorialPageViewController(tutorialPageViewController: OnboardingPageViewController, didUpdatePageCount count: Int) {
        pageControl.numberOfPages = count

    }
    
    func tutorialPageViewController(tutorialPageViewController: OnboardingPageViewController, didUpdatePageIndex index: Int) {
        pageControl.currentPage = index
    }
}
