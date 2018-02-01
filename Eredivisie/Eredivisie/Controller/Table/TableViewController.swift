//
//  TableViewController.swift
//  Eredivisie
//
//  Created by user on 1/10/18.
//  Copyright © 2018 vlad. All rights reserved.
//

import UIKit
import Foundation

class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tableModeSegmentedControl: UISegmentedControl!
    
    var teams: [Team] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.backgroundColor = .clear
        self.tableView.isScrollEnabled = false
        
        RequestNetworkManager.fetchTeams(leagueID: HollandLeagueID, handler: {
            self.teams = Team.allTeams
            self.teams.sort(by: { first, second in
                return first.overallPoints > second.overallPoints
            })
            self.tableView.reloadData()
        })
        self.tableModeSegmentedControl.selectedSegmentIndex = 1
        // Do any additional setup after loading the view.
        let colorTop = UIColor.orange.cgColor
        let colorMiddle = UIColor.white.cgColor
        let colorMiddle1 = UIColor.white.cgColor
        let colorBottom = UIColor.blue.cgColor
        
        let colorsArray = [colorTop, colorMiddle, colorMiddle1, colorBottom]
        
        self.view.setGradientBackgroundUniversal(colors: colorsArray, start: CGPoint(x: 0, y: 0), end: CGPoint(x: 1, y: 1))
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.teams.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "teamCell") as! TableCell
        
        cell.configureCell(forecast: self.teams[indexPath.row].createViewModel(with: Mode(rawValue: self.tableModeSegmentedControl.selectedSegmentIndex)!))
//        cell.configureCell(forecast: self.teams[indexPath.row], mode: TeamViewModel(rawValue: self.tableModeSegmentedControl.selectedSegmentIndex))
//        switch self.tableModeSegmentedControl.selectedSegmentIndex {
//        case 0:
//            cell.homeConfigureCell(forecast: self.teams[indexPath.row])
//        case 1:
//            cell.configureCell(forecast: self.teams[indexPath.row])
//        case 2:
//            cell.awayConfigureCell(forecast: self.teams[indexPath.row])
//        default:
//            cell.configureCell(forecast: self.teams[indexPath.row])
//        }
        
        cell.positionCell.text = String(indexPath.row + 1)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.tableView.frame.size.height / CGFloat(self.teams.count + 1)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let translationTransform = CATransform3DTranslate(CATransform3DIdentity, -500, 400, 0)
        cell.layer.transform = translationTransform
        
        UIView.animate(withDuration: 1, delay: 0.05 * Double(indexPath.row), options: .curveEaseInOut, animations:
            {
            cell.layer.transform = CATransform3DIdentity
        })
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableCell(withIdentifier: "teamCell") as! TableCell
        
        return view
    }
    
    
    @IBAction func segmentedControl(_ sender: UISegmentedControl) {
     
        switch sender.selectedSegmentIndex
        {
        case 0:
            self.teams = Team.allTeams
            self.teams.sort(by: { first, second in
                if first.homePoints == second.homePoints {
                    return first.homeGoalsScored > second.homeGoalsScored
                } else {
                return first.homePoints > second.homePoints
                }
            })
        
        case 1:
            self.teams = Team.allTeams
            self.teams.sort(by: { first, second in
                if first.overallPoints == second.overallPoints {
                    return first.overallGoalsScored > second.overallGoalsScored
                } else {
                    return first.overallPoints > second.overallPoints
                }
            })

        case 2:
            self.teams = Team.allTeams
            self.teams.sort(by: { first, second in
                if first.awayPoints == second.awayPoints {
                    return first.awayGoalsScored > second.awayGoalsScored
                } else {
                    return first.awayPoints > second.awayPoints
                }
            })
        default:
            break
        }
        
        self.tableView.reloadData()
//        print(sender.titleForSegment(at: sender.selectedSegmentIndex))
    }
}
