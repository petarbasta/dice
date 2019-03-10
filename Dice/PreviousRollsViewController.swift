//
//  PreviousRollsViewController.swift
//  Dice
//
//  Created by BASTA Petar on 28/2/2019.
//  Copyright © 2019 BASTA Petar. All rights reserved.
//

import UIKit

class PreviousRollsViewController: UIViewController {

    @IBOutlet weak var previousRollsLabel: UILabel!
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var averageLabel: UILabel!
    @IBOutlet weak var lastRollsLabel: UILabel!
    
    var numberOfDice = 1
    var sum = 0
    var diceType = 0
    var previouslyRolledList = [Int]()

    override func viewDidLoad() {
        averageLabel.text = nil
        lastRollsLabel.text = nil
        
        diceType = ChooseDiceViewController.diceType
        
        headerLabel.text = String(diceType) + " Sided Dice"
        
        if (diceType == 6){
            previouslyRolledList = RollDiceViewController.previouslyRolled[0][numberOfDice-1]
        }
        else if (diceType == 12){
            previouslyRolledList = RollDiceViewController.previouslyRolled[1][numberOfDice-1]
        }
        else {
            previouslyRolledList = RollDiceViewController.previouslyRolled[2][numberOfDice-1]
        }
        
        previousRollsLabel.text = nil
        
        sum = 0
        for pr in previouslyRolledList {
            sum = sum + pr
            if (previousRollsLabel.text == nil){
                previousRollsLabel.text = String(pr)
            }
            else {
                previousRollsLabel.text = previousRollsLabel.text! + " " + String(pr)
            }
        }
        
        if (previouslyRolledList.count > 0){
            if (previouslyRolledList.count == 1) {
                lastRollsLabel.text = "Last " + String(previouslyRolledList.count) + " Roll"
            }
            else {
                lastRollsLabel.text = "Last " + String(previouslyRolledList.count) + " Rolls"
            }
            averageLabel.text = "Average: " + String(Double(sum)/Double(previouslyRolledList.count))
        }
        else {
            lastRollsLabel.text = "No rolls yet"
        }
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func chooseNumberOfDice(_ sender: UIButton) {
        numberOfDice = sender.tag
        if (diceType == 6){
            previouslyRolledList = RollDiceViewController.previouslyRolled[0][numberOfDice-1]
        }
        else if (diceType == 12){
            previouslyRolledList = RollDiceViewController.previouslyRolled[1][numberOfDice-1]
        }
        else {
            previouslyRolledList = RollDiceViewController.previouslyRolled[2][numberOfDice-1]
        }
        self.viewDidLoad()
    }
    
    @IBAction func reset(_ sender: UIButton) {
        if (diceType == 6){
            RollDiceViewController.previouslyRolled[0][numberOfDice-1].removeAll()
        }
        else if (diceType == 12){
            RollDiceViewController.previouslyRolled[1][numberOfDice-1].removeAll()
        }
        else {
            RollDiceViewController.previouslyRolled[2][numberOfDice-1].removeAll()
        }
        self.viewDidLoad()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
