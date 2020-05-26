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
    var round = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        startNewRound()
        let thumbNailNormal = UIImage(named: "SliderThumb-Normal")!
        slider.setThumbImage(thumbNailNormal, for: .normal)
        
        let thumbNailHighlighted = UIImage(named: "SliderThumb-Highlighted")!
        slider.setThumbImage(thumbNailHighlighted, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        let trackLeftImage = UIImage(named: "SliderTrackLeft")!
        let trackLeftResizable = trackLeftImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        
        let trackRightImage = UIImage(named: "SliderTrackRight")!
        let trackRightResizable = trackRightImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackRightResizable, for: .normal)
    }
    
    
    @IBAction func showAlert(){
        let difference = abs(targetValue - currentValue)
        var points = 100 - difference
        if points == 100 {
            points += 100
        }
        if points == 99 {
            points += 50
        }
        score += points
        
        let message = "You scored \(points) points"
        
        let alert = UIAlertController(title: feedBack(difference), message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .cancel, handler: {
            _ in self.startNewRound()
        })
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
        
        
    }
    
    @IBAction func sliderValue(_ slider: UISlider){
        currentValue = lroundf(slider.value)
    }
    
    func startNewRound(){
        round += 1
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        
        updateLabels()
        
        
    }
    
    func updateLabels(){
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
        
    }
    
    func feedBack(_ difference: Int) -> String {
        if difference == 0 {
            return "Perfect!"
        } else if (difference < 10){
            return "You almost had it!"
        } else {
            return "Dude, you aint close!"
        }
    }
    
    @IBAction func startOver(){
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        score = 0
        slider.value = Float(currentValue)
        round = 1
        updateLabels()
        
    }
    
}

