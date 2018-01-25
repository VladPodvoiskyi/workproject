//
//  StatisticsTableViewCell.swift
//  Eredivisie
//
//  Created by user on 1/25/18.
//  Copyright © 2018 vlad. All rights reserved.
//

import UIKit

class StatisticsTableViewCell: UITableViewCell {

    
    
    func configureStatisticsCell (forecast: Statistics) {
         gameCell.text = "\(forecast.overallMatches!)"
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
