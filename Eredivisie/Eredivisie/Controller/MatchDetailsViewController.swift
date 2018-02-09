//
//  matchDetailsViewController.swift
//  Eredivisie
//
//  Created by user on 2/1/18.
//  Copyright © 2018 vlad. All rights reserved.
//

import UIKit
import Foundation

class MatchDetailsViewController: UIViewController {
    
    var statistics: Statistics!
    var customView: MatchDetailsView!
    var matchStatistics: MatchDetailsCell!
    var headerMatchStatistics: CustomHeaderMatchDetailsCell!
    
    var finalEventsArray = [HaveTime]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customView = MatchDetailsView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        self.view.addSubview(customView)
        setupSettingsTableView()
        self.setup(with: statistics)
        // Do any additional setup after loading the view.
        RequestNetworkManager.fetchEvents(dateFrom: RequestNetworkManager.DATE_FROM, dateTo: RequestNetworkManager.DATE_TO, leagueID: RequestNetworkManager.LEAGUE_ID) {
            
        }
        
        finalEventsArray = getEventsWithTime(events: statistics.events)
    }
    
 /////-------------------------------------------------------------------------------------------------------------/////////
    
    private func getEventsWithTime (events: [HaveTime]) -> [HaveTime] {
        let arrayWithTime = statistics.events.filter({$0.timeEvent != ""})
        
        let finalArray: [HaveTime] = arrayWithTime.sorted { (time1, time2) -> Bool in
            let time1Int = time1.timeEvent?.replacingOccurrences(of: "'", with: "")
            let time2Int = time2.timeEvent?.replacingOccurrences(of: "'", with: "")
            if let t1 = time1Int, let t2 = time2Int {
                if let tInt1 = Int(t1), let tInt2 = Int(t2) {
                    return tInt1 < tInt2
                }
            }
            return true
        }
        return finalArray
    }
    
    
    func setupSettingsTableView() {
        customView.matchDetailsTableView.dataSource = self
        customView.matchDetailsTableView.delegate = self
        
    }

    private func setup(with statistics: Statistics) {
        customView.matchDetailsHomeImageView.image = UIImage(named: statistics.homeTeamName)
        customView.matchDetailsAwayImageView.image = UIImage(named: statistics.awayTeamName)
        customView.matchDetailsTeamHomeLabel.text = statistics.homeTeamName
        customView.matchDetailsTeamAwayLabel.text = statistics.awayTeamName
        customView.matchDetailsHomeGoalsLabel.text = String(statistics.homeTeamScore)
        customView.matchDetailsAwayGoalsLabel.text = String(statistics.awayTeamScore)
    }
}

//MARK - UITableViewDelegate

extension MatchDetailsViewController: UITableViewDelegate {
    
}

//MARK - UITableViewDataSource

extension MatchDetailsViewController: UITableViewDataSource {

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = customView.matchDetailsTableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath) as! MatchDetailsCell

//        if let goal = statistics.events[indexPath.row] as? GoalScorer {
                if let goal = finalEventsArray[indexPath.row] as? GoalScorer {
            if let home = goal.homeScorer {
                if (!home.isEmpty) {
                    cell.playerHome.text = home
                    cell.imageEventHome.image = UIImage(named: "goal")
                }
            }
            
            if let away = goal.awayScorer {
                if (!away.isEmpty) {
                    cell.playerAway.text = away
                    cell.imageEventAway.image = UIImage(named: "goal")
                }
            }
            
            if let score = goal.score {
                cell.currentResult.text = score
            }
            
//            if let time = goal.time {
//               cell.minuteOfEvents.text = time
//            }
            
        }
        
//        if let card = statistics.events[indexPath.row] as? Card {
        if let card = finalEventsArray[indexPath.row] as? Card {
            if let home = card.homeFault {
                if (!home.isEmpty) {
                    cell.playerHome.text = home
                    if let color = card.card {
                        if color == "yellowcard" {
                            cell.imageEventHome.image = UIImage(named: "yellowcard")
                        } else if color == "redcard" {
                            cell.imageEventHome.image = UIImage(named: "redcard")
                        }
                    }
                }
            }
            
            if let away = card.awayFault {
                if (!away.isEmpty) {
                    cell.playerAway.text = away
                    if let color = card.card {
                        if color == "yellowcard" {
                            cell.imageEventAway.image = UIImage(named: "yellowcard")
                        } else if color == "redcard" {
                            cell.imageEventAway.image = UIImage(named: "redcard")
                        }
                    }
                }
            }
        }
//                if let time = statistics.events[indexPath.row].timeEvent {
                if let time = finalEventsArray[indexPath.row].timeEvent {
                    cell.minuteOfEvents.text = time
//                    if let timeSort = time.sorted
                    
                }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return statistics.events.count
        return finalEventsArray.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CustomHeaderMatchDetailsCell!
        
        return cell
    }
}
