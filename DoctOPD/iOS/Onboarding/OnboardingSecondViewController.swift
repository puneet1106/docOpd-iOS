//
//  OnboardingSecondViewController.swift
//  DoctOPD (iOS)
//
//  Created by Puneet on 22/06/21.
//

import UIKit

class OnboardingSecondViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = APPConstants.OnBoardingTitles.TITLE2
        subTitleLabel.text = APPConstants.OnBoardingSubTitles.SUBTITLE2

        // Do any additional setup after loading the view.
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
