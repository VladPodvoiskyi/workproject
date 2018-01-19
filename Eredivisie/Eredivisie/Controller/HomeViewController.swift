//
//  HomeViewController.swift
//  Eredivisie
//
//  Created by user on 1/19/18.
//  Copyright © 2018 vlad. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    var mainImageView: UIImageView = {
        let eredivisieImageView = UIImageView()
        eredivisieImageView.image = UIImage(named: "Eredivisie.png")
        eredivisieImageView.contentMode = .scaleAspectFill
        eredivisieImageView.translatesAutoresizingMaskIntoConstraints = false
        eredivisieImageView.isUserInteractionEnabled = true
        
        return eredivisieImageView
    }()
    
    override func viewDidLoad() {
        view.addSubview(mainImageView)
       mainImageViewConstrains()
        self.mainImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onEredivisieImageView)))

        super.viewDidLoad()

    }
    
    @objc func onEredivisieImageView() {
        print("booooom")
    }
    
    func mainImageViewConstrains() {
        mainImageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        mainImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        mainImageView.topAnchor.constraint(equalTo: self.mainImageView.superview!.topAnchor, constant: 85).isActive = true
//        mainImageView.leftAnchor.constraint(equalTo: self.mainImageView.superview!.topAnchor, constant: 10)
        mainImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        mainImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
       // (frame: CGRect(x:0, y:0, width:200, height:200))

     //   let mainImageViewImageURL = UIWebView()
    }
    
    //    func loadPage() {
    //        let myPage = "https://eredivisie.nl"
    //    }

 
}

