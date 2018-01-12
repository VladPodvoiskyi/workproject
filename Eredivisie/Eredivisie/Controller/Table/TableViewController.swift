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
        self.tableView.isScrollEnabled = false
        
        Team.fetchTeams(handler: {
            self.teams = Team.allTeams
            self.teams.sort(by: { first, second in
                return first.overallPosition < second.overallPosition
            })
            self.tableView.reloadData()
        })
        self.tableModeSegmentedControl.selectedSegmentIndex = 1
        // Do any additional setup after loading the view.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.teams.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "teamCell") as! TableCell

        switch self.tableModeSegmentedControl.selectedSegmentIndex {
        case 0:
            cell.homeConfigureCell(forecast: self.teams[indexPath.row])
        case 1:
            cell.configureCell(forecast: self.teams[indexPath.row])
        case 2:
            cell.awayConfigureCell(forecast: self.teams[indexPath.row])
        default:
            cell.configureCell(forecast: self.teams[indexPath.row])
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.tableView.frame.size.height / 18
    }
    
    @IBAction func segmentedControl(_ sender: UISegmentedControl) {
     
        switch sender.selectedSegmentIndex
        {
        case 0:
            self.teams = Team.allTeams
            self.teams.sort(by: { first, second in
            return first.homePosition < second.homePosition
            })
        case 1:
            self.teams = Team.allTeams
            self.teams.sort(by: { first, second in
            return first.overallPosition < second.overallPosition
            })
        case 2:
            self.teams = Team.allTeams
            self.teams.sort(by: { first, second in
            return first.awayPosition < second.awayPosition
        })
        default:
            break
        }
        
        self.tableView.reloadData()
//        print(sender.titleForSegment(at: sender.selectedSegmentIndex))
    }
}
