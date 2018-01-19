//
//  ViewController.swift
//  Eredivisie
//
//  Created by user on 1/9/18.
//  Copyright © 2018 vlad. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate {
    
    let mainImageView: UIImageView = {
        let eredivisieImageView = UIImageView()
        eredivisieImageView.image = UIImage(named: "Eredivisie.png")
        eredivisieImageView.translatesAutoresizingMaskIntoConstraints = false
        return eredivisieImageView
    }()

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(mainImageView)
        mainImageViewConstrains()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func mainImageViewConstrains() {
        mainImageView.widthAnchor.constraint(equalToConstant: 180).isActive = true
        mainImageView.heightAnchor.constraint(equalToConstant: 180).isActive = true
        mainImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mainImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 28).isActive = true
    }
    
//    func loadPage() {
//        let myPage = "https://eredivisie.nl"
//    }
    
}

