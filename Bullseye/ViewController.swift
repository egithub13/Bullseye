//
//  ViewController.swift
//  Bullseye
//
//  Created by eric hayes on 5/19/20.
//  Copyright © 2020 eric hayes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    var currentValue = 50
    var targetValue = 0
    var score = 0
    var round = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        startNewRound()
    }
    
    
    @IBAction func showAlert(){
        let difference = abs(targetValue - currentValue)
        let points = 100 - difference
        score += points
        
        let message = "You scored \(points) points"
        
        let alert = UIAlertController(title: "Hello, world!", message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
        startNewRound()
        
    }
    
    @IBAction func sliderValue(_ slider: UISlider){
        currentValue = lroundf(slider.value)
    }
    
    func startNewRound(){
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        
        updateLabels()
        round += 1
        
    }
    
    func updateLabels(){
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
        
    }
    
    
    
}

