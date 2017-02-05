//
//  ViewController.swift
//  GuessTheNumber
//
//  Created by Aditya on 1/31/17.
//  Copyright © 2017 Aditya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var headerTextField: UILabel!
    @IBOutlet weak var minTxtLabel: UILabel!
    @IBOutlet weak var maxTxtLabel: UILabel!
    @IBOutlet weak var minTxtField: UITextField!
    @IBOutlet weak var maxTxtField: UITextField!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var userGuess: UITextField!
    @IBOutlet weak var inputButton: UIButton!
    var numOfTries = 0
    
    
    var targetNumber = -1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
    }
    
    @IBAction func startTheGame(_ sender: UIButton){
        if let min = Int(minTxtField.text!), let max = Int(maxTxtField.text!){
            targetNumber = (Int)(arc4random()) % (max - min + 1) + min
            print(targetNumber)
            infoLabel.isHidden = false
            userGuess.isHidden = false
            inputButton.isHidden = false
            }
        else{
            let alert = UIAlertController(title: "ERROR" , message: "Your min and max are wrong inputs" , preferredStyle: .alert)
            let myAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            alert.addAction(myAction)
            present(alert, animated: true, completion:nil)
        
                    }
                }
    @IBAction func submitted(_ sender: Any){
        
        if let guess = Int(infoLabel.text!){
            numOfTries+=1
            if guess < targetNumber {
                infoLabel.text = "Increase your guess"
            }
            else if guess > targetNumber {
                infoLabel.text = "Lower your guess"
            }
            else{
//                infoLabel.text = "You Found It!"
                let congratsAlert = UIAlertController(title: "congrats", message:"You found it in \(numOfTries) tries", preferredStyle: .actionSheet)
                let action2 = UIAlertAction(title: "New Game", style: .default,
                handler:{ (UIAlertAction) -> () in self.numOfTries = 0})
                congratsAlert.addAction(action2)
                present(congratsAlert, animated: false, completion: nil)
            }
        }
        

    }
    
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }


}

