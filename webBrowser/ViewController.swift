//
//  ViewController.swift
//  webBrowser
//
//  Created by naseem on 15/08/2016.
//  Copyright © 2016 naseem. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var barView: UIView!
    
    @IBOutlet weak var urlField: UITextField!
    
    var webView: WKWebView?
    
    
    required init(coder aDecoder: NSCoder) {
        self.webView = WKWebView(frame: CGRectZero)
        super.init(coder: aDecoder)!
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        barView.frame = CGRect(x:0, y: 0, width: view.frame.width, height: 30)
        
        
        view.addSubview(webView!)
        webView!.translatesAutoresizingMaskIntoConstraints = false
        let height = NSLayoutConstraint(item: webView!, attribute: .Height, relatedBy: .Equal, toItem: view, attribute: .Height, multiplier: 1, constant: -44)
        let width = NSLayoutConstraint(item: webView!, attribute: .Width, relatedBy: .Equal, toItem: view, attribute: .Width, multiplier: 1, constant: 0)
        view.addConstraints([height, width])
        
        let url = NSURL(string:"http://www.yahoo.com")
        let request = NSURLRequest(URL:url!)
        webView!.loadRequest(request)

    }
    
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        barView.frame = CGRect(x:0, y: 0, width: size.width, height: 30)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
    urlField.resignFirstResponder()
    webView!.loadRequest(NSURLRequest(URL: NSURL(string: urlField.text!)!))
    return false
    }

   
} // End of ViewController Class.

