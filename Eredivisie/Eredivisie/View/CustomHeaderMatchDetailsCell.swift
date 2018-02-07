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
        view.backgroundColor = UIColor.gray
        
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
        
        
        
    }

}
