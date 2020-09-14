//
//  ViewController.swift
//  Make Your Color
//
//  Created by Дмитрий Кириченко on 14.09.2020.
//  Copyright © 2020 Dmitry Kirichenko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var topLabel: UILabel!
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    @IBOutlet var redValueLabel: UILabel!
    @IBOutlet var greenValueLabel: UILabel!
    @IBOutlet var blueValueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redTextField: UITextField!
    @IBOutlet var greenTextField: UITextField!
    @IBOutlet var blueTextField: UITextField!
    
    @IBOutlet var finalColor: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // View setup
        finalColor.layer.cornerRadius = 15
        finalColor.backgroundColor = .white
        
        // Slider's setup
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        blueSlider.minimumTrackTintColor = .blue
        
        // Text Field setup
        redTextField.placeholder = "1.00"
        greenTextField.placeholder = "1.00"
        blueTextField.placeholder = "1.00"
        
    }

    @IBAction func slidersAction() {
        let redValue = CGFloat(redSlider.value)
        let greenValue = CGFloat(greenSlider.value)
        let blueValue = CGFloat(blueSlider.value)

        finalColor.backgroundColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1)
        
        redValueLabel.text = String(format: "%.2f", redValue)
        greenValueLabel.text = String(format: "%.2f", greenValue)
        blueValueLabel.text = String(format: "%.2f", blueValue)
    }

    
}
