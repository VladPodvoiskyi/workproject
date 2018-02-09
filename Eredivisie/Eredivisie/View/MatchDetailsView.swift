//
//  MatchDetailsView.swift
//  Eredivisie
//
//  Created by user on 2/5/18.
//  Copyright © 2018 vlad. All rights reserved.
//

import UIKit

class MatchDetailsView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        makeConstraints()
    }
    
    var matchDetailsHomeImageView: UIImageView = {
        let homeTeamImageView = UIImageView()
        homeTeamImageView.translatesAutoresizingMaskIntoConstraints = false
        homeTeamImageView.contentMode = .scaleToFill
        homeTeamImageView.backgroundColor = .red
        homeTeamImageView.layer.cornerRadius = 45
        homeTeamImageView.layer.masksToBounds = true
        
        return homeTeamImageView
    }()
    
    var matchDetailsAwayImageView: UIImageView = {
        let awayTeamImageView = UIImageView()
        awayTeamImageView.translatesAutoresizingMaskIntoConstraints = false
        awayTeamImageView.backgroundColor = .yellow
        awayTeamImageView.contentMode = .scaleToFill
        awayTeamImageView.layer.cornerRadius = 30
        awayTeamImageView.layer.masksToBounds = true
        
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
    
    
    var matchDetailsTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.isScrollEnabled = true
        tableView.separatorStyle = .singleLine
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = .clear
        tableView.register(MatchDetailsCell.self, forCellReuseIdentifier: "detailCell")
    
        return tableView
    }()
    
    private func createBackgroundMatchDetailsView() {
        let colorTop = UIColor.orange.cgColor
        let colorMiddle = UIColor.white.cgColor
        let colorMiddle1 = UIColor.white.cgColor
        let colorBottom = UIColor.blue.cgColor
        
        let colorsArray = [colorTop, colorMiddle, colorMiddle1, colorBottom]
        
        self.setGradientBackgroundUniversal(colors: colorsArray, start: CGPoint(x: 0, y: 0), end: CGPoint(x: 1, y: 1))
    }
    
    private func makeConstraints() {
        //        create constraints for matchDetailsHomeImageView
        self.addSubview(matchDetailsHomeImageView)
        matchDetailsHomeImageView.widthAnchor.constraint(equalToConstant: 140).isActive = true
        matchDetailsHomeImageView.heightAnchor.constraint(equalToConstant: 140).isActive = true
        matchDetailsHomeImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 105).isActive = true
        matchDetailsHomeImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40).isActive = true
        
        
        //        create constraints for matchDetailsHomeImageView
        self.addSubview(matchDetailsAwayImageView)
        matchDetailsAwayImageView.widthAnchor.constraint(equalToConstant: 140).isActive = true
        matchDetailsAwayImageView.heightAnchor.constraint(equalToConstant: 140).isActive = true
        matchDetailsAwayImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 105).isActive = true
        matchDetailsAwayImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40).isActive = true
        
        
        
        //        create constraints for matchDetailsHomeGoalsLabel
        self.addSubview(matchDetailsHomeGoalsLabel)
        matchDetailsHomeGoalsLabel.widthAnchor.constraint(equalToConstant: 60).isActive = true
        matchDetailsHomeGoalsLabel.heightAnchor.constraint(equalToConstant: 60).isActive = true
        matchDetailsHomeGoalsLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 250).isActive = true
        matchDetailsHomeGoalsLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 80).isActive = true
        
        
        //        create constraints for matchDetailsAwayGoalsLabel
        self.addSubview(matchDetailsAwayGoalsLabel)
        matchDetailsAwayGoalsLabel.widthAnchor.constraint(equalToConstant: 60).isActive = true
        matchDetailsAwayGoalsLabel.heightAnchor.constraint(equalToConstant: 60).isActive = true
        matchDetailsAwayGoalsLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 250).isActive = true
        matchDetailsAwayGoalsLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -80).isActive = true
        
        
        //        create constraints for matchDetailsTeamHomeLabel
        self.addSubview(matchDetailsTeamHomeLabel)
        matchDetailsTeamHomeLabel.widthAnchor.constraint(equalToConstant: 170).isActive = true
        matchDetailsTeamHomeLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        matchDetailsTeamHomeLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 310).isActive = true
        matchDetailsTeamHomeLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        
        
        //        create constraints for matchDetailsTeamAwayLabel
        self.addSubview(matchDetailsTeamAwayLabel)
        matchDetailsTeamAwayLabel.widthAnchor.constraint(equalToConstant: 170).isActive = true
        matchDetailsTeamAwayLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        matchDetailsTeamAwayLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 310).isActive = true
        matchDetailsTeamAwayLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        
        
        //        create constraints for matchDetailsTableView
        self.addSubview(matchDetailsTableView)
        matchDetailsTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5).isActive = true
        matchDetailsTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5).isActive = true
        matchDetailsTableView.topAnchor.constraint(equalTo: self.topAnchor, constant: 350).isActive = true
        matchDetailsTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        createBackgroundMatchDetailsView()
    }

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
