//
//  TableCell.swift
//  Eredivisie
//
//  Created by user on 1/10/18.
//  Copyright © 2018 vlad. All rights reserved.
//

import UIKit
import Foundation
import Alamofire

class TableCell: UITableViewCell {
    
    @IBOutlet weak var positionCell: UILabel!
    @IBOutlet weak var teamCell: UILabel!
    @IBOutlet weak var gameCell: UILabel!
    @IBOutlet weak var winCell: UILabel!
    @IBOutlet weak var drawCell: UILabel!
    @IBOutlet weak var loseCell: UILabel!
    @IBOutlet weak var goalDifferenceCell: UILabel!
    @IBOutlet weak var pointsCell: UILabel!
    
    func configureCell(forecast: Team) {
//        positionCell.text = "\(forecast.overallPosition!)"
        teamCell.text = "\(forecast.teamName!)"
        gameCell.text = "\(forecast.overallMatches!)"
        winCell.text = "\(forecast.overallWin!)"
        drawCell.text = "\(forecast.overallDraw!)"
        loseCell.text = "\(forecast.overallLose!)"
        goalDifferenceCell.text = "\(forecast.overallGoalsScored! - forecast.overallMissedGoals!)"
        pointsCell.text = "\(forecast.overallPoints!)"
    }
    
    func homeConfigureCell(forecast: Team) {
//        positionCell.text = "\(forecast.homePosition!)"
        teamCell.text = "\(forecast.teamName!)"
        gameCell.text = "\(forecast.homeMatches!)"
        winCell.text = "\(forecast.homeWin!)"
        drawCell.text = "\(forecast.homeDraw!)"
        loseCell.text = "\(forecast.homeLose!)"
        goalDifferenceCell.text = "\(forecast.homeGoalsScored! - forecast.homeMissedGoals!)"
        pointsCell.text = "\(forecast.homePoints!)"
    }
    
    func awayConfigureCell(forecast: Team) {
//        positionCell.text = "\(forecast.awayPosition!)"
        teamCell.text = "\(forecast.teamName!)"
        gameCell.text = "\(forecast.awayMatches!)"
        winCell.text = "\(forecast.awayWin!)"
        drawCell.text = "\(forecast.awayDraw!)"
        loseCell.text = "\(forecast.awayLose!)"
        goalDifferenceCell.text = "\(forecast.awayGoalsScored! - forecast.awayMissedGoals!)"
        pointsCell.text = "\(forecast.awayPoints!)"
    }
    
}
