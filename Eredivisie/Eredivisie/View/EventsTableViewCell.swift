//
//  EventsTableViewCell.swift
//  Eredivisie
//
//  Created by user on 2/13/18.
//  Copyright © 2018 vlad. All rights reserved.
//

import UIKit

class EventsTableViewCell: UITableViewCell {

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
        
        return label
    }()
    
    var awayTeam: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .footnote)
        
        return label
    }()
    
    
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
        self.addSubview(teamSeparator)
    }
    //create constraints for labels
    private func addConstraints() {
        
        self.teamSeparator.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        self.teamSeparator.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        self.teamSeparator.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.5).isActive = true
        
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
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
}
