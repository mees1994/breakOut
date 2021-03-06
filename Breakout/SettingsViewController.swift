//
//  SettingsViewController.swift
//  Breakout
//
//  Created by developer on 11/06/16.
//  Copyright (c) 2016 developer. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    // Mark: outlets
    
    @IBOutlet weak var speedBallSlider: UISlider!
    @IBOutlet weak var speeBallLabel: UILabel!
    
    @IBOutlet weak var paddleSizeSlider: UISlider!
    @IBOutlet weak var paddleSizeLabel: UILabel!
    
    @IBOutlet weak var startOverSwitch: UISwitch!
    
    @IBOutlet weak var ballsStepper: UIStepper!
    @IBOutlet weak var ballStepperLabel: UILabel!
    
    @IBOutlet weak var brickSegmentedControl: UISegmentedControl!
    
    
    
    // Mark: action functions
    
    @IBAction func speedBallChanged(sender: UISlider) {
        let speedBall = Int(sender.value)
        speeBallLabel.text = "\(speedBall)"
        settingsModel().speedBalls = speedBall
    }
    
    @IBAction func sizePaddleChanged(sender: UISlider) {
        let paddleSize = Int(sender.value)
        paddleSizeLabel.text = "\(paddleSize)"
        settingsModel().paddleSize = paddleSize
    }
    
    @IBAction func startoverChanged(sender: UISwitch) {
        let startOver = sender.on
        settingsModel().startOver = startOver
    }
    
    @IBAction func numberOfBallsChanged(sender: UIStepper) {
        let numberOfBalls = Int(sender.value)
        ballStepperLabel.text = "\(numberOfBalls)"
        settingsModel().numberOfBalls = numberOfBalls
    }
    
    @IBAction func brickHealthChanged(sender: UISegmentedControl) {
        let brickHealth = sender.selectedSegmentIndex + 1
        settingsModel().brickHealth = brickHealth
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        speedBallSlider.minimumValue = 1
        speedBallSlider.maximumValue = 5
        paddleSizeSlider.minimumValue = 1
        paddleSizeSlider.maximumValue = 5
        ballsStepper.minimumValue = 1
        ballsStepper.maximumValue = 10
        ballsStepper.wraps = true
        ballsStepper.autorepeat = true
        
        speedBallSlider.value = Float(settingsModel().speedBalls)
        speeBallLabel.text = "\(settingsModel().speedBalls)"
        
        paddleSizeSlider.value = Float(settingsModel().paddleSize)
        paddleSizeLabel.text = "\(settingsModel().paddleSize)"
        
        ballsStepper.value = Double(settingsModel().numberOfBalls)
        ballStepperLabel.text = "\(settingsModel().numberOfBalls)"
        
        startOverSwitch.setOn( settingsModel().startOver, animated: false)

        brickSegmentedControl.selectedSegmentIndex = (settingsModel().brickHealth - 1)

        
        
    }
    
}
