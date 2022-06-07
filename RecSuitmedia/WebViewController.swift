//
//  WebViewController.swift
//  RecSuitmedia
//
//  Created by PUTRI RAHMADEWI on 07/06/22.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    
    let webView = WKWebView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(webView)
        
        guard let url = URL(string: "https://suitmedia.com") else {
            return
        }
        
        webView.load(URLRequest(url: url))
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        webView.frame = view.bounds
    }
    
}
