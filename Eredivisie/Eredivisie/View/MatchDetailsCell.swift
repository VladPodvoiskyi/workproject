//
//  MatchDetailsCell.swift
//  Eredivisie
//
//  Created by user on 2/2/18.
//  Copyright © 2018 vlad. All rights reserved.
//

import UIKit

class MatchDetailsCell: UITableViewCell {
    
    
    var minuteOfEvents: UILabel = {
        let time = UILabel()
        time.text = "16"
        time.translatesAutoresizingMaskIntoConstraints = false
        
        return time
    }()
    
    var playerHome: UILabel = {
        let pH = UILabel()
        pH.text = "Holland"
        pH.translatesAutoresizingMaskIntoConstraints = false
        
        return pH
    }()
    
    var imageEventHome: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    var currentResult: UILabel = {
        let result = UILabel()
        result.text = "10:10"
        result.translatesAutoresizingMaskIntoConstraints = false
        
        return result
    }()
    
    var imageEventAway: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    var playerAway: UILabel = {
       let pA = UILabel()
        pA.text = "Netherlands"
        pA.translatesAutoresizingMaskIntoConstraints = false
        
        return pA
    }()
    
    private func makeView() {
        createConstraints()
    }
    
    
    func createConstraints() {
//        create constraints for minuteOfEvents
        self.addSubview(minuteOfEvents)
        currentResult.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        currentResult.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        currentResult.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.5).isActive = true
        
    }
    
    
    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        self.makeView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
