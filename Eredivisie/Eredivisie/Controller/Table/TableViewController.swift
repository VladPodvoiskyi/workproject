//
//  TableViewController.swift
//  Eredivisie
//
//  Created by user on 1/10/18.
//  Copyright © 2018 vlad. All rights reserved.
//

import UIKit

class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBAction func segmentedControl(_ sender: UISegmentedControl) {
        print(sender.titleForSegment(at: sender.selectedSegmentIndex))
    }
    
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
        // Do any additional setup after loading the view.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.teams.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "teamCell") as! TableCell
        cell.configureCell(forecast: self.teams[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return (self.view.frame.height - 20 - 20 - (self.navigationController?.navigationBar.frame.size.height)! - (self.tabBarController?.tabBar.frame.size.height)!) / 18
        
        return self.tableView.frame.size.height / 18
    }
}
