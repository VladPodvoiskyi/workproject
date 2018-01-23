//
//  HomeViewController.swift
//  Eredivisie
//
//  Created by user on 1/19/18.
//  Copyright © 2018 vlad. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {


    var mainImageView: UIImageView = {
        let eredivisieImageView = UIImageView()
        eredivisieImageView.image = UIImage(named: "Eredivisie.png")
        eredivisieImageView.contentMode = .scaleAspectFill
        eredivisieImageView.translatesAutoresizingMaskIntoConstraints = false
        eredivisieImageView.isUserInteractionEnabled = true
        
        return eredivisieImageView
    }()
    
    var homeTableView = UITableView ()

    var homeTableViewCell = UITableViewCell()
    
    
    override func viewDidLoad() {
        mainImageViewConstrains()
        self.mainImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onEredivisieImageView)))
        
     //   homeTableView = UITableView(frame: self.view.bounds, style: UITableViewStyle.plain)
        homeTableView.backgroundColor = UIColor.yellow
        
//        self.homeTableView.reloadData()
        
        self.homeTableView.register(HomeTableViewCell.self, forCellReuseIdentifier: "HomeTableViewCell")
        
        super.viewDidLoad()
    }
    
    @objc func onEredivisieImageView() {
        print("booooom")
    }
    
    func mainImageViewConstrains() {
        self.view.addSubview(mainImageView)
        mainImageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        mainImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
//        mainImageView.topAnchor.constraint(equalTo: self.mainImageView.superview!.topAnchor, constant: 85).isActive = true
        mainImageView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 85).isActive = true
        mainImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        self.homeTableView.translatesAutoresizingMaskIntoConstraints = false
        self.homeTableView.dataSource = self
        self.homeTableView.delegate = self
//        self.homeTableView.isScrollEnabled = false
        
        
        self.view.addSubview(homeTableView)
        homeTableView.topAnchor.constraint(equalTo: self.mainImageView.bottomAnchor, constant: 10).isActive = true
        homeTableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10).isActive = true
        homeTableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10).isActive = true
        homeTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        homeTableView.layer.cornerRadius = 30
        
    }
    
    //    func loadPage() {
    //        let myPage = "https://eredivisie.nl"
    //    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = homeTableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as! HomeTableViewCell
//        cell?.setUpCell()
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.homeTableView.frame.size.height / 10
    }


}
