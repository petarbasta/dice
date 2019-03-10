//
//  ViewController.swift
//  Dice
//
//  Created by BASTA Petar on 28/2/2019.
//  Copyright © 2019 BASTA Petar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        for _ in 0...2 {
            let secondLayer = [[Int]]()
            RollDiceViewController.previouslyRolled.append(secondLayer)
        }
        
        for i in 0...2 {
            for _ in 0...4 {
                let thirdLayer = [Int]()
                RollDiceViewController.previouslyRolled[i].append(thirdLayer)
            }
        }
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
}

