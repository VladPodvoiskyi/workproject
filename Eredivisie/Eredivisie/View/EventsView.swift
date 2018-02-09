//
//  EventsView.swift
//  Eredivisie
//
//  Created by user on 2/9/18.
//  Copyright © 2018 vlad. All rights reserved.
//

import UIKit

class EventsView: UIView, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var eventsPickerView = UIPickerView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        makeEventView()
        
        
   //     eventsPickerView.frame = CGRect(x: 170, y: 85, width: 200, height: 150)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
        var eventsImage: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = UIColor.red
        image.translatesAutoresizingMaskIntoConstraints = false
            
        return image
    }()
    
    let teams = ["ADO Den Haag", "Ajax", "AZ Alkmaar", "Excelsior", "FC Groningen", "FC Twente", "FC Utrecht", "Feyenoord", "Heracles", "NAC Breda", "PEC Zwolle", "PSV Eindhoven", "Roda JC Kerkrade", "SC Heerenveen", "Sparta Rotterdam", "Vitesse", "VVV-Venlo", "Willem II"]
    
    func makeEventView() {
        createConstraints()
        eventsPickerView.delegate = self
        eventsPickerView.dataSource = self
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return teams.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return teams[row]
    }
 
//-----------------------------------------------------------///
    func createConstraints() {
        self.addSubview(eventsImage)
        eventsImage.widthAnchor.constraint(equalToConstant: 120).isActive = true
        eventsImage.heightAnchor.constraint(equalToConstant: 120).isActive = true
        eventsImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 105).isActive = true
        eventsImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40).isActive = true
        
        self.addSubview(eventsPickerView)
        eventsImage.widthAnchor.constraint(equalToConstant: 120).isActive = true
        eventsImage.heightAnchor.constraint(equalToConstant: 180).isActive = true
        eventsImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 105).isActive = true
        eventsImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 170).isActive = true
    }
    
}
