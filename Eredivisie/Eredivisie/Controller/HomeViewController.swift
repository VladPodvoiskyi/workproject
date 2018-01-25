//
//  HomeViewController.swift
//  Eredivisie
//
//  Created by user on 1/19/18.
//  Copyright © 2018 vlad. All rights reserved.
//

import UIKit


struct ourStruct {
    var time: String!
    var date: String!
}
class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    var arrayHeader = [ourStruct]()
    //create image on mainpage
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
        
        homeTableView.backgroundColor = UIColor.lightGray
        
//        self.homeTableView.reloadData()
        
        self.homeTableView.register(HomeTableViewCell.self, forCellReuseIdentifier: "cell")
        self.homeTableView.register(CustomHeaderCell.self, forHeaderFooterViewReuseIdentifier: "CustomHeaderCell")
       arrayHeader = [ourStruct.init(time: "20:00", date: "Sunday, 22.03.2018"), ourStruct.init(time: "21:00", date: "Monday, 23.03.2018"), ourStruct.init(time: "22:00", date: "Tuesday, 24.03.2018")]
        super.viewDidLoad()
    }
    
    @objc func onEredivisieImageView() {
        print("booooom")
    }
    
    func mainImageViewConstrains() {
        self.view.addSubview(mainImageView)
        mainImageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        mainImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        mainImageView.topAnchor.constraint(equalTo: self.mainImageView.superview!.topAnchor, constant: 85).isActive = true
        mainImageView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 85).isActive = true
        mainImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        self.homeTableView.translatesAutoresizingMaskIntoConstraints = false
        self.homeTableView.dataSource = self
        self.homeTableView.delegate = self
//        self.homeTableView.contentInset = UIEdgeInsetsMake(100.0, 0.0, 0.0, 0.0)
               
        
        self.view.addSubview(homeTableView)
        homeTableView.topAnchor.constraint(equalTo: self.mainImageView.bottomAnchor, constant: 10).isActive = true
        homeTableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10).isActive = true
        homeTableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10).isActive = true
        homeTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        //homeTableView.layer.cornerRadius = 30
        
    }
    
    //    func loadPage() {
    //        let myPage = "https://eredivisie.nl"
    //    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = homeTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HomeTableViewCell
//        cell?.setUpCell()
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.homeTableView.frame.size.height / 22
    }
   
    func numberOfSections(in tableView: UITableView) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "CustomHeaderCell") as! CustomHeaderCell
        
        if arrayHeader.count > 1 {
            if section % 3 == 0 {
                view.dateLabel.text = arrayHeader[0].date
                view.timeLabel.text = arrayHeader[0].time
            } else if section % 3 == 1 {
                view.dateLabel.text = arrayHeader[1].date
                view.timeLabel.text = arrayHeader[1].time
            }  else {
                view.dateLabel.text = arrayHeader[2].date
                view.timeLabel.text = arrayHeader[2].time
            }
        }
        
//        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 30))
//        view.backgroundColor = UIColor.orange
//        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HomeTableViewCell") as! CustomHeaderCell
//        let headerView = Bundle.main.loadNibNamed("CustomHeaderCell", owner: self, options: nil)?.first as! CustomHeaderCell
        // headerView.timeLabel.text = arrayHeader[section].time
      //  headerView.dateLabel.text = arrayHeader[section].date
//
//        return headerView
        return view
    }
    
//    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//        let showStatics = showStaticsAction(at: indexPath)
//        let reminder = reminderAction(at: indexPath)
//        
//        return UISwipeActionsConfiguration(action: [showStatics, reminder])
//    }
//    
//    func showStatisticsAction
//    
}
