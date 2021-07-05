//
//  TermsCondition_VC.swift


import UIKit
import WebKit

class TermsCondition_VC: UIViewController {

    @IBOutlet weak var myActivityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var webView: WKWebView!
    
    var openUrl: String         =   ""
    var navigationtitle: String =   ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = false
        self.title  =   navigationtitle
        myActivityIndicator.startAnimating()
        webView.uiDelegate = self
        webView.navigationDelegate = self
        let myURL = URL(string: openUrl)
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setUpNavigation()
        DispatchQueue.main.asyncAfter(deadline: .now() + 8.0) {
            self.myActivityIndicator.stopAnimating()
        }
    }
    
    func setUpNavigation() {
        if #available(iOS 11.0, *) {
            self.navigationController?.navigationBar.prefersLargeTitles =   false
        }
        self.navigationController!.navigationBar.tintColor =   .black
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.tabBarController?.tabBar.isHidden = true
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension TermsCondition_VC: WKNavigationDelegate, WKUIDelegate{
    
    func webView(_ webView: WKWebView, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        if let serverTrust = challenge.protectionSpace.serverTrust {
            completionHandler(.useCredential, URLCredential(trust: serverTrust))
        }
    }
}

