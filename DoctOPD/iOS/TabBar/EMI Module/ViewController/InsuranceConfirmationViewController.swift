//
//  InsuranceConfirmationViewController.swift
//  DoctOPD (iOS)
//
//  Created by Puneet on 30/06/21.
//

import UIKit

class InsuranceConfirmationViewController: UIViewController {

    @IBOutlet weak var backToHomeButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
   
    func setUpUI(){
        
        /*
         static let TITLE_ATR: [NSAttributedString.Key: Any] = [NSAttributedString.Key.font: UIFont(name: APPConstants.Font.GOTHAM_MEDIUM, size: 17.0) ?? UIFont()]
         */
        self.backToHomeButton.addBorderAndColor(color: .clear, width: 0.0, corner_radius: 5.0, clipsToBounds: true)
        
    }
    
    @IBAction func backToHomeActn(_ sender: UIButton) {
        self.tabBarController?.selectedIndex = 0
    }
    
    @IBAction func backButtonActn(_ sender: UIButton) {
        self.tabBarController?.selectedIndex = 0
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
