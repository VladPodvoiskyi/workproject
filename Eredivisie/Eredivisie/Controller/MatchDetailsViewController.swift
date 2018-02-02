//
//  matchDetailsViewController.swift
//  Eredivisie
//
//  Created by user on 2/1/18.
//  Copyright © 2018 vlad. All rights reserved.
//

import UIKit
import Foundation

class MatchDetailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var statistics: Statistics!
    var matchDetailsHomeImageView: UIImageView = {
        let homeTeamImageView = UIImageView()
        homeTeamImageView.translatesAutoresizingMaskIntoConstraints = false
        homeTeamImageView.contentMode = .scaleToFill
        homeTeamImageView.backgroundColor = .red
//        homeTeamImageView.image = UIImage(named: "matchDetailsTeamHomeLabel")
        
        return homeTeamImageView
    }()
    
    var matchDetailsAwayImageView: UIImageView = {
        let awayTeamImageView = UIImageView()
        awayTeamImageView.translatesAutoresizingMaskIntoConstraints = false
        awayTeamImageView.backgroundColor = .yellow
        awayTeamImageView.contentMode = .scaleToFill
//        awayTeamImageView.image = UIImage(named: "matchDetailsTeamAwayLabel")
        
        return awayTeamImageView
    }()
    
    var matchDetailsTeamHomeLabel: UILabel = {
        let teamHomeLabel = UILabel()
        teamHomeLabel.translatesAutoresizingMaskIntoConstraints = false
        teamHomeLabel.font = UIFont.boldSystemFont(ofSize: 20)
        teamHomeLabel.contentMode = .scaleAspectFill
        teamHomeLabel.textAlignment = .center
        teamHomeLabel.text = "Roda JC Kerkrade"
        
        return teamHomeLabel
    }()
    
    var matchDetailsTeamAwayLabel: UILabel = {
        let teamAwayLabel = UILabel()
        teamAwayLabel.translatesAutoresizingMaskIntoConstraints = false
        teamAwayLabel.font = UIFont.boldSystemFont(ofSize: 20)
        teamAwayLabel.contentMode = .scaleAspectFill
        teamAwayLabel.textAlignment = .center
        teamAwayLabel.text = "Roda JC Kerkrade"
        
        return teamAwayLabel
    }()
    
    
    var matchDetailsHomeGoalsLabel: UILabel = {
        let goalHomeLabel = UILabel()
        goalHomeLabel.translatesAutoresizingMaskIntoConstraints = false
        goalHomeLabel.textAlignment = .center
        goalHomeLabel.font = UIFont.boldSystemFont(ofSize: 30)
        goalHomeLabel.text = "88"
        
        return goalHomeLabel
    } ()
    
    
    var matchDetailsAwayGoalsLabel: UILabel = {
        let goalAwayLabel = UILabel()
        goalAwayLabel.translatesAutoresizingMaskIntoConstraints = false
        goalAwayLabel.textAlignment = .center
        goalAwayLabel.font = UIFont.boldSystemFont(ofSize: 30)
        goalAwayLabel.text = "86"
        
        return goalAwayLabel
    } ()
    
    
    var matchDetailsTableView = UITableView ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.makeConstrains()
        self.createMatchDetailsTableView()
        self.matchDetailsTableView.reloadData()
        self.setup(with: statistics)
        self.createBackgroundMatchDetailsView()

        // Do any additional setup after loading the view.
    }
 /////-------------------------------------------------------------------------------------------------------------/////////
    
    func createMatchDetailsTableView() {
        matchDetailsTableView.register(MatchDetailsCell.self, forCellReuseIdentifier: "detailCell")
        self.matchDetailsTableView.translatesAutoresizingMaskIntoConstraints = false
        self.matchDetailsTableView.dataSource = self
        self.matchDetailsTableView.delegate = self
        self.matchDetailsTableView.isScrollEnabled = false
        self.matchDetailsTableView.reloadData()
    }
    
    
    func makeConstrains() {
//        create constraints for matchDetailsHomeImageView
        self.view.addSubview(matchDetailsHomeImageView)
        matchDetailsHomeImageView.widthAnchor.constraint(equalToConstant: 140).isActive = true
        matchDetailsHomeImageView.heightAnchor.constraint(equalToConstant: 140).isActive = true
        matchDetailsHomeImageView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 105).isActive = true
        matchDetailsHomeImageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 40).isActive = true

        
//        create constraints for matchDetailsHomeImageView
        self.view.addSubview(matchDetailsAwayImageView)
        matchDetailsAwayImageView.widthAnchor.constraint(equalToConstant: 140).isActive = true
        matchDetailsAwayImageView.heightAnchor.constraint(equalToConstant: 140).isActive = true
        matchDetailsAwayImageView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 105).isActive = true
        matchDetailsAwayImageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -40).isActive = true
        
        
        
//        create constraints for matchDetailsHomeGoalsLabel
        self.view.addSubview(matchDetailsHomeGoalsLabel)
        matchDetailsHomeGoalsLabel.widthAnchor.constraint(equalToConstant: 60).isActive = true
        matchDetailsHomeGoalsLabel.heightAnchor.constraint(equalToConstant: 60).isActive = true
        matchDetailsHomeGoalsLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 250).isActive = true
        matchDetailsHomeGoalsLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 80).isActive = true
        
        
//        create constraints for matchDetailsAwayGoalsLabel
        self.view.addSubview(matchDetailsAwayGoalsLabel)
        matchDetailsAwayGoalsLabel.widthAnchor.constraint(equalToConstant: 60).isActive = true
        matchDetailsAwayGoalsLabel.heightAnchor.constraint(equalToConstant: 60).isActive = true
        matchDetailsAwayGoalsLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 250).isActive = true
        matchDetailsAwayGoalsLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -80).isActive = true
        
        
//        create constraints for matchDetailsTeamHomeLabel
        self.view.addSubview(matchDetailsTeamHomeLabel)
        matchDetailsTeamHomeLabel.widthAnchor.constraint(equalToConstant: 170).isActive = true
        matchDetailsTeamHomeLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        matchDetailsTeamHomeLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 310).isActive = true
        matchDetailsTeamHomeLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30).isActive = true
        
        
//        create constraints for matchDetailsTeamAwayLabel
        self.view.addSubview(matchDetailsTeamAwayLabel)
        matchDetailsTeamAwayLabel.widthAnchor.constraint(equalToConstant: 170).isActive = true
        matchDetailsTeamAwayLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        matchDetailsTeamAwayLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 310).isActive = true
        matchDetailsTeamAwayLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30).isActive = true
    
    
//        create constraints for matchDetailsTableView
        self.view.addSubview(matchDetailsTableView)
        matchDetailsTableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10).isActive = true
        matchDetailsTableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10).isActive = true
        matchDetailsTableView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 350).isActive = true
        matchDetailsTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
    //MARK - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.matchDetailsTableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath) as! MatchDetailsCell
        
        return cell
    }
    
    
    //MARK - UITableViewDelegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    private func setup(with statistics: Statistics) {
        matchDetailsHomeImageView.image = UIImage(named: statistics.homeTeamName)
        matchDetailsAwayImageView.image = UIImage(named: statistics.awayTeamName)
        matchDetailsTeamHomeLabel.text = statistics.homeTeamName
        matchDetailsTeamAwayLabel.text = statistics.awayTeamName
        matchDetailsHomeGoalsLabel.text = String(statistics.homeTeamScore)
        matchDetailsAwayGoalsLabel.text = String(statistics.awayTeamScore)
    }
    
    func createBackgroundMatchDetailsView() {
        let colorTop = UIColor.orange.cgColor
        let colorMiddle = UIColor.white.cgColor
        let colorMiddle1 = UIColor.white.cgColor
        let colorBottom = UIColor.blue.cgColor
        
        let colorsArray = [colorTop, colorMiddle, colorMiddle1, colorBottom]
        
        self.view.setGradientBackgroundUniversal(colors: colorsArray, start: CGPoint(x: 0, y: 0), end: CGPoint(x: 1, y: 1))
    }
}
