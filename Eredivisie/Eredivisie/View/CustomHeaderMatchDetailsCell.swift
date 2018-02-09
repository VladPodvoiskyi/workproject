//
//  CustomHeaderMatchDetailsCell.swift
//  Eredivisie
//
//  Created by user on 2/6/18.
//  Copyright © 2018 vlad. All rights reserved.
//

import UIKit
import Foundation
import Alamofire

class CustomHeaderMatchDetailsCell: UITableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        makeView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var headerLabel: UILabel = {
        let label = UILabel()
        label.text = "Match details"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        
        return label
    }()
    
    var baseView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.cyan
        
        return view
    }()
    
    private func makeView() {
        createConstraints()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        makeView()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func createConstraints() {
        self.addSubview(baseView)
        self.baseView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        self.baseView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        self.baseView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        self.baseView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        self.addSubview(headerLabel)
        self.headerLabel.widthAnchor.constraint(equalToConstant: 40).isActive = true
        self.headerLabel.topAnchor.constraint(equalTo: baseView.topAnchor).isActive = true
        self.headerLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        
//        headerLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
//        headerLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
//        headerLabel.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.5).isActive = true
//        headerLabel.widthAnchor.constraint(equalToConstant: 70).isActive = true
       // headerLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 150).isActive = true
    }

}


