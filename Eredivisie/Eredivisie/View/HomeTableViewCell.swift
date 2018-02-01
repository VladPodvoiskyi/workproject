//
//  HomeTableViewCell.swift
//  Eredivisie
//
//  Created by user on 1/22/18.
//  Copyright © 2018 vlad. All rights reserved.
//

import UIKit
import Foundation

class HomeTableViewCell: UITableViewCell {
    
//    var homeTeamName: UILabel!
//
//    func setUpCell () {
//        homeTeamName = UILabel()
//        self.contentView.backgroundColor = .clear
//        self.contentView.addSubview(homeTeamName)
//
//    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        makeView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        makeView()
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }
// create labels for cell
    var homeTeam: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .footnote)
//        label.text = "Sparta Rotterdam"
        
        return label
    }()
    
    var awayTeam: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .footnote)
//        label.text = "Ajax"
        
        return label
    }()
    
    
//    var homeTeamGoals: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.font = UIFont.preferredFont(forTextStyle: .footnote)
////        label.textAlignment = .center
//        label.text = "39"
//        
//        return label
//    }()
//    
//    var awayTeamGoals: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.font = UIFont.preferredFont(forTextStyle: .footnote)
//        label.text = "18"
//        
//        return label
//    }()
    
    var teamSeparator: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ":"
        
        return label
    }()
    
    private func makeView() {
        addMySubView()
        addConstraints()
    }
    
    private func addMySubView() {

        self.addSubview(homeTeam)
        self.addSubview(awayTeam)
//        self.addSubview(homeTeamGoals)
//        self.addSubview(awayTeamGoals)
        self.addSubview(teamSeparator)
    }
    //create constraints for labels
    private func addConstraints() {
        
        self.teamSeparator.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        self.teamSeparator.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        self.teamSeparator.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.5).isActive = true
        
//        self.homeTeamGoals.topAnchor.constraint(equalTo: teamSeparator.topAnchor).isActive = true
//        self.homeTeamGoals.heightAnchor.constraint(equalTo: teamSeparator.heightAnchor).isActive = true
//        self.homeTeamGoals.widthAnchor.constraint(equalToConstant: 20).isActive = true
//        self.homeTeamGoals.trailingAnchor.constraint(equalTo: teamSeparator.leadingAnchor, constant: 0).isActive = true
        
//        self.awayTeamGoals.topAnchor.constraint(equalTo: teamSeparator.topAnchor).isActive = true
//        self.awayTeamGoals.heightAnchor.constraint(equalTo: teamSeparator.heightAnchor).isActive = true
//        self.awayTeamGoals.widthAnchor.constraint(equalToConstant: 20).isActive = true
//        self.awayTeamGoals.leadingAnchor.constraint(equalTo: teamSeparator.trailingAnchor, constant: 3).isActive = true
        
        self.homeTeam.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        self.homeTeam.topAnchor.constraint(equalTo: teamSeparator.topAnchor).isActive = true
        self.homeTeam.heightAnchor.constraint(equalTo: teamSeparator.heightAnchor).isActive = true
        self.homeTeam.trailingAnchor.constraint(equalTo: teamSeparator.leadingAnchor, constant: -5).isActive = true
        
        self.awayTeam.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15).isActive = true
        self.awayTeam.topAnchor.constraint(equalTo: teamSeparator.topAnchor).isActive = true
        self.awayTeam.heightAnchor.constraint(equalTo: teamSeparator.heightAnchor).isActive = true
        self.awayTeam.leadingAnchor.constraint(equalTo: teamSeparator.trailingAnchor, constant: 5).isActive = true
    }
    
    private func setup(with statistics: Statistics) {

        homeTeam.text = "\(statistics.homeTeamName)"
        awayTeam.text = "\(statistics.awayTeamName)"
//        homeTeamGoals.text = "\(statistics.homeTeamScore)"
//        awayTeamGoals.text = "\(statistics.awayTeamScore)"
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    

}
