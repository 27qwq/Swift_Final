//
//  ViewController.swift
//  Final_exam_277
//
//  Created by apple on 2019/12/23.
//  Copyright © 2019 apple. All rights reserved.
//


import UIKit

import WebKit

class ViewController: UIViewController, WKUIDelegate {

    @IBOutlet weak var webView: WKWebView!
          
    @IBOutlet weak var myIndicator: UIActivityIndicatorView!
       
    // 网址
    var link: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        

        //let myURL = URL(string: "http://hr.nju.edu.cn")
        if let linkurl = link {
            print(linkurl)
            let myURL = URL(string: linkurl)
            let mySeq = URLRequest(url: myURL!)
        
            webView.uiDelegate = self
            webView.navigationDelegate = self
            webView.load(mySeq)
        }
    }


}

extension ViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.myIndicator.stopAnimating()
        self.myIndicator.isHidden = true
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        self.myIndicator.isHidden = true
        self.myIndicator.startAnimating()
    }

}

