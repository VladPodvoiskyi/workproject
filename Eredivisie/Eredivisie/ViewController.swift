//
//  ViewController.swift
//  Eredivisie
//
//  Created by user on 1/9/18.
//  Copyright © 2018 vlad. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Team.fetchTeams()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

