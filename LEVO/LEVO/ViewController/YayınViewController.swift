//
//  YayınViewController.swift
//  LEVO
//
//  Created by Arca Sahin on 20.05.2023.
//

import UIKit
import WebKit


    class Yay_nViewController: UIViewController , WKUIDelegate{

        
        @IBOutlet var webKitView: WKWebView!
        
        override func loadView() {
               let webConfiguration = WKWebViewConfiguration()
               webKitView = WKWebView(frame: .zero, configuration: webConfiguration)
               webKitView.uiDelegate = self
               view = webKitView
           }
        
        override func viewDidLoad() {
            super.viewDidLoad()
            let barAppearance = UINavigationBarAppearance()
                barAppearance.configureWithTransparentBackground()
                barAppearance.backgroundColor = .systemBackground
                barAppearance.shadowColor = nil
                navigationController?.navigationBar.isTranslucent = true
                navigationController?.navigationBar.scrollEdgeAppearance = barAppearance
                navigationController?.navigationBar.standardAppearance = barAppearance
            let tabAppear = UITabBarAppearance()
            tabAppear.backgroundColor = .systemBackground
            tabBarController?.tabBar.isTranslucent = true
            tabBarController?.tabBar.standardAppearance = tabAppear
            
            
            let webConfiguration = WKWebViewConfiguration()
                  webConfiguration.dataDetectorTypes = [.all]
                  webKitView = WKWebView(frame: .zero, configuration: webConfiguration)
                  webKitView.uiDelegate = self
                  
                  webKitView.translatesAutoresizingMaskIntoConstraints = false
                  view.addSubview(webKitView)
                  
                  NSLayoutConstraint.activate([
                      webKitView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
                      webKitView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                      webKitView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
                      webKitView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
                  ])
            // Do any additional setup after loading the view.
        
        
        let myURL = URL(string:"https://www.twitch.tv/levo")
               let myRequest = URLRequest(url: myURL!)
        webKitView.load(myRequest)

           }
    }
