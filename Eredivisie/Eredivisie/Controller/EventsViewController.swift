//
//  EventsViewController.swift
//  Eredivisie
//
//  Created by user on 2/9/18.
//  Copyright © 2018 vlad. All rights reserved.
//

import UIKit

struct MyNewDate {
    var time: String!
    var date: String!
}

class EventsViewController: UIViewController {
    
    
    @IBOutlet weak var eventImageView: UIImageView!
    @IBOutlet weak var eventPickerView: UIPickerView!
    
    var arrayOfData = [EventsStatistics]()
    var newEvents: [(MyNewDate, [EventsStatistics])] = []
    
    var newNewEvents: [(MyNewDate, [EventsStatistics])] = []
    
    var eventsTableView = UITableView()
    var eventsTableViewCell = UITableViewCell()
    
    var eventsHeadertableViewCell = EventsHeaderTableViewCell()
    

    var teams = ["ADO Den Haag", "Ajax", "AZ Alkmaar", "Excelsior", "FC Groningen", "FC Twente", "FC Utrecht", "Feyenoord", "Heracles", "NAC Breda", "PEC Zwolle", "PSV Eindhoven", "Roda JC Kerkrade", "SC Heerenveen", "Sparta Rotterdam", "Vitesse", "VVV-Venlo", "Willem II"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        eventsHeadertableViewCell.addConstraintsForHeaderSell()
        view.addSubview(eventPickerView)
    
        eventPickerView.isUserInteractionEnabled = true
        eventPickerView.delegate = self
        eventPickerView.dataSource = self
        

        eventsTableView.register(EventsTableViewCell.self, forCellReuseIdentifier: "cell")
        eventsTableView.register(EventsHeaderTableViewCell.self, forHeaderFooterViewReuseIdentifier: "EventsHeaderTableViewCell")
        eventsTableViewConstrains()
        fetch()
        
        newNewEvents = newEvents
    }
    
    func fetch() {
        RequestNetworkManager.fetchEventsView(dateFrom: dateFromURL, dateTo: dateToURL, leagueID: HollandLeagueID, handler: {
            self.arrayOfData = EventsStatistics.allStatistics
            
            self.arrayOfData.forEach({ (item) in
                let date = MyNewDate(time: item.matchTime, date: item.date)
                
                var isAddedToEvents = false
                
                for (index, itemEvent) in self.newEvents.enumerated() {
                    if itemEvent.0.time == date.time && itemEvent.0.date == date.date {
                        self.newEvents[index].1.append(item)
                        isAddedToEvents = true
                        break
                    }
                }
                
                if !isAddedToEvents {
                    self.newEvents.append((date, [item]))
                }
            })
            self.eventsTableView.reloadData()
        })
    }
    
    func eventsTableViewConstrains() {
        view.addSubview(eventsTableView)
    
        eventsTableView.dataSource = self
        eventsTableView.delegate = self
        eventsTableView.translatesAutoresizingMaskIntoConstraints = false

        eventsTableView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 220).isActive = true
        eventsTableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10).isActive = true
        eventsTableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10).isActive = true
        eventsTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        //homeTableView.layer.cornerRadius = 30
    }
}

extension EventsViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return teams.count
    }
}

extension EventsViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return teams[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        eventImageView.image = UIImage(named: teams[row])
        
        newNewEvents.removeAll()
        
        for item in newEvents {
            for newItem in item.1 {
                if newItem.homeTeamName == teams[row] || newItem.awayTeamName == teams[row] {
                    newNewEvents.append(item)
                }
            }
        }
        
        self.eventsTableView.reloadData()
        
//        arrayOfData = arrayOfData.filter({ (eventsStat) -> Bool in
//            eventsStat.homeTeamName == teams[row]
//        })
//        self.eventsTableView.reloadData()
    }
}

extension EventsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.eventsTableView.frame.size.height / 22
    }
    
    private func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> UIView {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "EventsHeaderTableViewCell") as! EventsHeaderTableViewCell
        view.dateLabel.text = self.newEvents[section].0.date
        view.timeLabel.text = self.newEvents[section].0.time
        
        return view
    }
}

extension EventsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//            return self.newEvents[section].1.count
        return newNewEvents[section].1.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        //return self.newEvents.count
        return newNewEvents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.eventsTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? EventsTableViewCell
        //        cell?.setUpCell()
        
        
        if let homeTeamName = self.newNewEvents[indexPath.section].1[indexPath.row].homeTeamName {
            cell?.homeTeam.text = homeTeamName
        }
        
        if let awayTeamName = self.newNewEvents[indexPath.section].1[indexPath.row].awayTeamName {
            cell?.awayTeam.text = awayTeamName
        }
        
        if let homeTeamScore = self.newNewEvents[indexPath.section].1[indexPath.row].homeTeamScore, let awayTeamScore = self.newNewEvents[indexPath.section].1[indexPath.row].awayTeamScore {
            let homeTeamGoals = String(homeTeamScore)
            let awayTeamGoals = String(awayTeamScore)
            cell?.teamSeparator.text = homeTeamGoals + " : " + awayTeamGoals
        } else {
            cell?.teamSeparator.text = "  :  "
        }
        
        if newNewEvents[indexPath.section].1[indexPath.row].matchStatus.isEmpty {
            
        }
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "EventsHeaderTableViewCell") as! EventsHeaderTableViewCell
        view.dateLabel.text = self.newEvents[section].0.date
        view.timeLabel.text = self.newEvents[section].0.time
        
        return view
    }
    
}


