//
//  ViewController.swift
//  Bullseye
//
//  Created by Alex Lu on 8/17/20.
//  Copyright © 2020 Alexandra Lu. All rights reserved.
//

import UIKit
import Foundation


class ViewController: UIViewController {

    @IBOutlet weak var numLabel: UILabel!
    @IBOutlet weak var numSlider: UISlider!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var exactSwitch: UISwitch!
    @IBOutlet weak var playAgainButton: UIButton!
    
    var randomNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        randomNumber = Int(arc4random_uniform(101))
        numLabel.text = "Move the slider to: \(randomNumber)"
        
    }
    
    @IBAction func checkValue(_ sender: Any) {
        if exactSwitch.isOn == false {
            if randomNumber-3 <= Int(numSlider.value) && randomNumber+3 >= Int(numSlider.value){
                resultLabel.text = "You were right on point! Bullseye!"
            } else {
                resultLabel.text = "Whoops! You missed! Try again later"
            }
        } else {
            if randomNumber == Int(numSlider.value) {
                resultLabel.text = "You were right on point! Bullseye!"
            } else {
                resultLabel.text = "Whoops! You missed! Try again later"
            }
        }
        resultLabel.isHidden = false
        playAgainButton.isHidden = false
    }
    
    @IBAction func playAgain(_ sender: Any) {
        numSlider.setValue(50.0, animated: false)
        randomNumber = Int(arc4random_uniform(101))
        numLabel.text = "Move the slider to: \(randomNumber)"
        resultLabel.isHidden = true
        playAgainButton.isHidden = true
    }
    
    @IBAction func sliderValueChanged(_ sender: Any) {
//        numLabel.text = "\(Int(numSlider.value))"
    }
}

