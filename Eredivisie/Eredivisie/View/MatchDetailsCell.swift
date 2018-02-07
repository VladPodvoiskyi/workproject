//
//  MatchDetailsCell.swift
//  Eredivisie
//
//  Created by user on 2/2/18.
//  Copyright © 2018 vlad. All rights reserved.
//

import UIKit
import Foundation

class MatchDetailsCell: UITableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        makeView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var minuteOfEvents: UILabel = {
        let time = UILabel()
        time.text = "16"
        time.translatesAutoresizingMaskIntoConstraints = false
        time.font = UIFont.systemFont(ofSize: 14)
        
        return time
    }()
    
    var playerHome: UILabel = {
        let pH = UILabel()
        pH.text = ""
        pH.font = UIFont.systemFont(ofSize: 14)
        pH.translatesAutoresizingMaskIntoConstraints = false
        pH.textAlignment = .right
        
        return pH
    }()
    
    var imageEventHome: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .clear
        
        return image
    }()
    
    var currentResult: UILabel = {
        let result = UILabel()
        result.text = ""
        result.font = UIFont.systemFont(ofSize: 14)
        result.translatesAutoresizingMaskIntoConstraints = false
        
        return result
    }()
    
    var imageEventAway: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .clear
        
        return image
    }()
    
    var playerAway: UILabel = {
       let pA = UILabel()
        pA.text = ""
        pA.font = UIFont.systemFont(ofSize: 14)
        pA.translatesAutoresizingMaskIntoConstraints = false
        
        return pA
    }()
    
    private func makeView() {
        createConstraints()
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        self.makeView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func createConstraints() {
//        create constraints for currentResult
        self.addSubview(minuteOfEvents)
//        minuteOfEvents.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        minuteOfEvents.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        minuteOfEvents.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.5).isActive = true
        minuteOfEvents.widthAnchor.constraint(equalToConstant: 10)
        minuteOfEvents.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5).isActive = true
        
//        create constraints for minuteOfEvents
        self.addSubview(currentResult)
//        currentResult.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        currentResult.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        currentResult.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.5).isActive = true
        currentResult.widthAnchor.constraint(equalToConstant: 44).isActive = true
        currentResult.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 175).isActive = true
        
//        create constraints for imageEventHome
        self.addSubview(imageEventHome)
        imageEventHome.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        imageEventHome.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.5).isActive = true
        imageEventHome.widthAnchor.constraint(equalToConstant: 18).isActive = true
        imageEventHome.leadingAnchor.constraint(equalTo: minuteOfEvents.leadingAnchor, constant: 147).isActive = true
        
//        create constraints for imageEventaway
        self.addSubview(imageEventAway)
        imageEventAway.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        imageEventAway.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.5).isActive = true
        imageEventAway.widthAnchor.constraint(equalToConstant: 18).isActive = true
        imageEventAway.leadingAnchor.constraint(equalTo: minuteOfEvents.leadingAnchor, constant: 210).isActive = true
        
        //        create constraints for playerHome
        self.addSubview(playerHome)
        playerHome.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        playerHome.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.5).isActive = true
        playerHome.widthAnchor.constraint(equalToConstant: 130).isActive = true
        playerHome.leadingAnchor.constraint(equalTo: minuteOfEvents.leadingAnchor, constant: 15).isActive = true
        
        //        create constraints for playerAway
        self.addSubview(playerAway)
        playerAway.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        playerAway.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.5).isActive = true
        playerAway.widthAnchor.constraint(equalToConstant: 140).isActive = true
        playerAway.leadingAnchor.constraint(equalTo: minuteOfEvents.leadingAnchor, constant: 230).isActive = true
      
    }

}
