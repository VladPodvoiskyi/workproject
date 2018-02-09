//
//  EventsViewController.swift
//  Eredivisie
//
//  Created by user on 2/9/18.
//  Copyright © 2018 vlad. All rights reserved.
//

import UIKit

class EventsViewController: UIViewController {

    
    var showPickerView = EventsView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(showPickerView)
        showPickerView.makeEventView()
        
    }
    

}
