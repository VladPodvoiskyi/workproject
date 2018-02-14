//
//  HomeViewController.swift
//  Eredivisie
//
//  Created by user on 1/19/18.
//  Copyright © 2018 vlad. All rights reserved.
//

import UIKit
import Foundation



struct MyDate {
    var time: String!
    var date: String!
}
class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
//    var arrayHeader = [ourStruct]()
    
    var arrayOfData = [Statistics]()
    var events: [(MyDate, [Statistics])] = []
    var refresh = UIRefreshControl()
    
    
//    var startSelection: String {
////        var selection = self.arrayOfData.
//    }
    
    //create image on mainpage
    var mainImageView: UIImageView = {
        let eredivisieImageView = UIImageView()
        eredivisieImageView.image = UIImage(named: "Eredivisie.png")
        eredivisieImageView.contentMode = .scaleAspectFill
        eredivisieImageView.translatesAutoresizingMaskIntoConstraints = false
        eredivisieImageView.isUserInteractionEnabled = true
        
        return eredivisieImageView
    }()
    
    var homeTableView = UITableView()
    var homeTableViewCell = UITableViewCell()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mainImageViewConstrains()

        self.mainImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onEredivisieImageView)))
        
        homeTableView.backgroundColor = UIColor.lightGray
        
        self.homeTableView.register(HomeTableViewCell.self, forCellReuseIdentifier: "cell")
        self.homeTableView.register(CustomHeaderCell.self, forHeaderFooterViewReuseIdentifier: "CustomHeaderCell")
        
        self.refresh.addTarget(self, action: #selector(handelRefresh), for: .valueChanged)
        self.refresh.tintColor = UIColor.yellow
        homeTableView.addSubview(refresh)
        

        //TODO it will be imolemented
        RequestNetworkManager.fetchEvents(dateFrom: dateFromURL, dateTo: dateToURL, leagueID: HollandLeagueID, handler: {
            self.arrayOfData = Statistics.allStatistics
            
            self.arrayOfData.forEach({ (item) in
                let date = MyDate(time: item.matchTime, date: item.date)
                
                var isAddedToEvents = false
                
                for (index, itemEvent) in self.events.enumerated() {
                    if itemEvent.0.time == date.time && itemEvent.0.date == date.date {
                        self.events[index].1.append(item)
                        isAddedToEvents = true
                        break
                    }
                }
                
                if !isAddedToEvents {
                    self.events.append((date, [item]))
                }
            })
            self.homeTableView.reloadData()
        })
    }

    
    @objc func handelRefresh() {
        refresh.endRefreshing()
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
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.events[section].1.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = homeTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HomeTableViewCell
//        cell?.setUpCell()
        
        
        if let homeTeamName = self.events[indexPath.section].1[indexPath.row].homeTeamName {
            cell.homeTeam.text = homeTeamName
        }
        
        if let awayTeamName = self.events[indexPath.section].1[indexPath.row].awayTeamName {
            cell.awayTeam.text = awayTeamName
        }
        
        if let homeTeamScore = self.events[indexPath.section].1[indexPath.row].homeTeamScore, let awayTeamScore = self.events[indexPath.section].1[indexPath.row].awayTeamScore {
            let homeTeamGoals = String(homeTeamScore)
            let awayTeamGoals = String(awayTeamScore)
            cell.teamSeparator.text = homeTeamGoals + " : " + awayTeamGoals
        } else {
            cell.teamSeparator.text = "  :  "
        }

        if self.events[indexPath.section].1[indexPath.row].matchStatus.isEmpty {
            
        }
        
        return cell
    }
    
    
//    private func filterDate() {
//        let date : Date = Date()
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "yyyy-MM-dd"
//        
//        let todayDate = dateFormatter.string(from: date)
//        let pastDate = todayDate.dateByAddingTimeInterval(-360*24)
//        
//        let dateNew = Statistics.allStatistics
//        let tableDate = dateNew
//        
//        print(todayDate)
//    }
    
//    private func getEventsWithTime (events: [HaveTime]) -> [HaveTime] {
//        let arrayWithTime = statistics.events.filter({$0.timeEvent != ""})
//
//        let finalArray: [HaveTime] = arrayWithTime.sorted { (time1, time2) -> Bool in
//            let time1Int = time1.timeEvent?.replacingOccurrences(of: "'", with: "")
//            let time2Int = time2.timeEvent?.replacingOccurrences(of: "'", with: "")
//            if let t1 = time1Int, let t2 = time2Int {
//                if let tInt1 = Int(t1), let tInt2 = Int(t2) {
//                    return tInt1 < tInt2
//                }
//            }
//            return true
//        }
//        return finalArray
//    }
    

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return self.homeTableView.frame.size.height / 22
    }

   
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.events.count
    }
    
    //todo
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "CustomHeaderCell") as! CustomHeaderCell
        view.dateLabel.text = self.events[section].0.date
        view.timeLabel.text = self.events[section].0.time
        
        return view
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let controler = self.storyboard?.instantiateViewController(withIdentifier: "MatchDetails") as! MatchDetailsViewController
        controler.statistics = self.events[indexPath.section].1[indexPath.row]
        self.navigationController?.pushViewController(controler, animated: true)
        
    }
       
}
