//
//  EventsHeaderTableViewCell.swift
//  Eredivisie
//
//  Created by user on 2/12/18.
//  Copyright © 2018 vlad. All rights reserved.
//

import UIKit
import Alamofire
import Foundation

class EventsHeaderTableViewCell: UITableViewHeaderFooterView {

    var timeLabel: UILabel = {
        let time = UILabel()
        time.text = "21:00"
        time.translatesAutoresizingMaskIntoConstraints = false
        time.adjustsFontSizeToFitWidth = true
        time.textAlignment = .center
        
        return time
    }()
    
    var dateLabel: UILabel = {
        let date = UILabel()
        date.text = "Friday, January 24, 2018"
        date.translatesAutoresizingMaskIntoConstraints = false
        date.adjustsFontSizeToFitWidth = true
        date.textAlignment = .left
        return date
    }()
    
    var baseView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.cyan
        
        return view
    }()
    
    
    private func makeView() {
        addMySubView()
        addConstraintsForHeaderSell()
        createBackgroundMatchDetailsView()
    }
    
    private func addMySubView() {
        self.addSubview(baseView)
        self.addSubview(timeLabel)
        self.addSubview(dateLabel)
    }
    
    private func createBackgroundMatchDetailsView() {
        let colorTop = UIColor.orange.cgColor
        let colorMiddle = UIColor.white.cgColor
        let colorMiddle1 = UIColor.white.cgColor
        let colorBottom = UIColor.blue.cgColor
        
        let colorsArray = [colorTop, colorMiddle, colorMiddle1, colorBottom]
        
        self.setGradientBackgroundUniversal(colors: colorsArray, start: CGPoint(x: 0, y: 0), end: CGPoint(x: 1, y: 1))
    }
    //create headerConstrains for timeLabel and dateLabel
    func addConstraintsForHeaderSell() {
        self.baseView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        self.baseView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        self.baseView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        self.baseView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        self.timeLabel.leadingAnchor.constraint(equalTo: baseView.leadingAnchor, constant: 10).isActive = true
        self.timeLabel.widthAnchor.constraint(equalToConstant: 40).isActive = true
        self.timeLabel.topAnchor.constraint(equalTo: baseView.topAnchor).isActive = true
        self.timeLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        self.dateLabel.leadingAnchor.constraint(equalTo: self.timeLabel.trailingAnchor, constant: 10).isActive = true
        self.dateLabel.trailingAnchor.constraint(equalTo: baseView.trailingAnchor).isActive = true
        self.dateLabel.topAnchor.constraint(equalTo: self.timeLabel.topAnchor).isActive = true
        self.dateLabel.heightAnchor.constraint(equalTo: self.timeLabel.heightAnchor).isActive = true
    }
    
    func setup(with statistics: EventsStatistics) {
        timeLabel.text = "\(statistics.matchTime!)"
        dateLabel.text = "\(statistics.date)"
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.makeView()
    }
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        makeView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
