//
//  RollDiceViewController.swift
//  Dice
//
//  Created by BASTA Petar on 28/2/2019.
//  Copyright © 2019 BASTA Petar. All rights reserved.
//

import UIKit

public extension UIView {
    
    func shake(count : Float = 4,for duration : TimeInterval = 0.3,withTranslation translation : Float = 5) {
        let animation : CABasicAnimation = CABasicAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        animation.repeatCount = count
        animation.duration = duration/TimeInterval(animation.repeatCount)
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: CGFloat(-translation), y: self.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: CGFloat(translation), y: self.center.y))
        layer.add(animation, forKey: "shake")
    }
}

class RollDiceViewController: UIViewController {
    @IBOutlet weak var firstDie: UIImageView!
    @IBOutlet weak var secondDie: UIImageView!
    @IBOutlet weak var thirdDie: UIImageView!
    @IBOutlet weak var fourthDie: UIImageView!
    @IBOutlet weak var fifthDie: UIImageView!
    @IBOutlet weak var firstDieNumber: UILabel!
    @IBOutlet weak var secondDieNumber: UILabel!
    @IBOutlet weak var thirdDieNumber: UILabel!
    @IBOutlet weak var fourthDieNumber: UILabel!
    @IBOutlet weak var fifthDieNumber: UILabel!
    
    var numberOfDice = 1
    static var previouslyRolled = [[[Int]]]()

    var diceType = 0
    
    var imageToOpen = String()
    
    var dice = [UIImageView]()
    var diceNumbers = [UILabel]()
    
    override func viewDidLoad() {
        diceType = ChooseDiceViewController.diceType
        imageToOpen = String(diceType) + "Sided.png"
        dice = [firstDie,secondDie,thirdDie,fourthDie,fifthDie]
        diceNumbers = [firstDieNumber,secondDieNumber,thirdDieNumber,fourthDieNumber,fifthDieNumber]
        
        for die in diceNumbers {
            die.text = nil
        }
        
        for i in 0...numberOfDice-1 {
            diceNumbers[i].frame.origin = CGPoint(x: dice[i].frame.origin.x + 66 , y: dice[i].frame.origin.y + 61)
            if (diceType == 12){
                diceNumbers[i].frame.origin = CGPoint(x: diceNumbers[i].frame.origin.x , y: diceNumbers[i].frame.origin.y + 12)
            }
        }
        firstDie.image = UIImage(named:imageToOpen)
        super.viewDidLoad()
    }
    
    @IBAction func chooseNumberOfDice(_ sender: UIButton) {
        numberOfDice = sender.tag
        
        for die in diceNumbers {
            die.text = nil
        }
        
        if (numberOfDice == 1){
            firstDie.frame.origin = CGPoint(x: 127, y: 213)
        }
        else if (numberOfDice == 2) {
            firstDie.frame.origin = CGPoint(x: 35, y: 213)
            secondDie.frame.origin = CGPoint(x: 215, y: 213)
        }
        else if (numberOfDice == 3) {
            firstDie.frame.origin = CGPoint(x: 35, y: 187)
            secondDie.frame.origin = CGPoint(x: 215, y: 187)
            thirdDie.frame.origin = CGPoint(x: 127, y: 365)
        }
        else if (numberOfDice == 4) {
            firstDie.frame.origin = CGPoint(x: 35, y: 193)
            secondDie.frame.origin = CGPoint(x: 215, y: 193)
            thirdDie.frame.origin = CGPoint(x: 35, y: 368)
            fourthDie.frame.origin = CGPoint(x: 215, y: 368)
        }
        else if (numberOfDice == 5) {
            firstDie.frame.origin = CGPoint(x: 36, y: 111)
            secondDie.frame.origin = CGPoint(x: 214, y: 111)
            thirdDie.frame.origin = CGPoint(x: 36, y: 286)
            fourthDie.frame.origin = CGPoint(x: 214, y: 286)
            fifthDie.frame.origin = CGPoint(x: 127, y: 461)
        }
        
        for i in 0...numberOfDice-1 {
            diceNumbers[i].frame.origin = CGPoint(x: dice[i].frame.origin.x + 66 , y: dice[i].frame.origin.y + 61)
            if (diceType == 12){
                diceNumbers[i].frame.origin = CGPoint(x: diceNumbers[i].frame.origin.x , y: diceNumbers[i].frame.origin.y + 12)
            }
        }
        
        for i in 0...4 {
            dice[i].image = nil
        }
        
        for i in 0...numberOfDice-1 {
            dice[i].image = UIImage(named:imageToOpen)
        }
    }
    
    @IBAction func rollDie(_ sender: UIButton) {
        for die in diceNumbers {
            die.text = nil
        }

        CATransaction.begin()
        CATransaction.setCompletionBlock({
            self.nextRoll()
        })
        for i in 0...numberOfDice-1 {
            dice[i].shake()
        }
        CATransaction.commit()
    }
    
    func nextRoll(){
        if (diceType != 6){
            if (diceType == 12){
                var sum = 0
                for i in 0...numberOfDice-1 {
                    let numberRolled = Int.random(in: 1..<diceType+1)
                    sum += numberRolled
                    diceNumbers[i].text = String(numberRolled)
                }
                
                RollDiceViewController.previouslyRolled[1][numberOfDice-1].insert(sum, at: 0)
                
                if (RollDiceViewController.previouslyRolled[1][numberOfDice-1].count > 200){
                    RollDiceViewController.previouslyRolled[1][numberOfDice-1].removeLast()
                }
            }
            else {
                var sum = 0
                for i in 0...numberOfDice-1 {
                    let numberRolled = Int.random(in: 1..<diceType+1)
                    sum += numberRolled
                    diceNumbers[i].text = String(numberRolled)
                }
                
                RollDiceViewController.previouslyRolled[2][numberOfDice-1].insert(sum, at: 0)
                
                if (RollDiceViewController.previouslyRolled[2][numberOfDice-1].count > 200){
                    RollDiceViewController.previouslyRolled[2][numberOfDice-1].removeLast()
                }
            }
        }
        else {
            var sum = 0
            for i in 0...numberOfDice-1 {
                let numberRolled = Int.random(in: 1..<diceType+1)
                sum += numberRolled
                dice[i].image = UIImage(named:String(numberRolled) + ".png")
            }
            RollDiceViewController.previouslyRolled[0][numberOfDice-1].insert(sum, at: 0)
            
            if (RollDiceViewController.previouslyRolled[0][numberOfDice-1].count > 200){
                RollDiceViewController.previouslyRolled[0][numberOfDice-1].removeLast()
            }
        }
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
