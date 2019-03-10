//
//  ChooseDiceViewController.swift
//  Dice
//
//  Created by BASTA Petar on 28/2/2019.
//  Copyright © 2019 BASTA Petar. All rights reserved.
//

import UIKit

class ChooseDiceViewController: UIViewController {

    static var diceType = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }

    @IBAction func chooseDice(_ sender: UIButton) {
        ChooseDiceViewController.diceType = sender.tag
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
