//
//  DetailViewController.swift
//  MVC+Delegation-Review-Lab
//
//  Created by Jaheed Haynes on 1/27/20.
//  Copyright © 2020 Benjamin Stone. All rights reserved.
//

import UIKit

protocol TableViewDelegate: AnyObject {
    func fontdidChange(changeVC: SettingsViewController, fontSize: CGFloat)
}

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var movieTitle: UILabel!
    
    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var stepper: UIStepper!
    
    @IBOutlet weak var fontSizeLabel: UILabel!
    
     let defaults = UserDefaults.standard
 
    

  var fontSize: CGFloat = 17 {
            didSet {
                delegate?.fontdidChange(changeVC: self, fontSize: fontSize)
            }
        }
        
        weak var delegate: TableViewDelegate?
        
        override func viewDidLoad() {
            super.viewDidLoad()
            fontSizeLabel.text = "Font Size: \(String(format: "%0.f", fontSize))"
            configureSlider()
            configureStepper()
        }
        
        func configureSlider() {
            slider.minimumValue = 1.0
            slider.maximumValue = 50.0
            slider.value = Float(fontSize)
        }
        
        func configureStepper() {
            stepper.minimumValue = 1.0
            stepper.maximumValue = 100.0
            stepper.value = Double(fontSize)
            stepper.stepValue = 1.0
            
            
        }
    
    func saveData(){
       
    }
        
        @IBAction func sliderAction(_ sender: UISlider) {
            fontSize = CGFloat(sender.value)
            stepper.value = Double(sender.value)
            fontSizeLabel.text = "Font Size: \(String(format: "%0.f", fontSize))"
        }
        
        @IBAction func stepperAction(_ sender: UIStepper) {
            fontSize = CGFloat(sender.value)
            slider.value = Float(sender.value)
            fontSizeLabel.text = "Font Size: \(String(format: "%0.f", fontSize))"
        }
    }
