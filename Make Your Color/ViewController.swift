//
//  ViewController.swift
//  Make Your Color
//
//  Created by Дмитрий Кириченко on 14.09.2020.
//  Copyright © 2020 Dmitry Kirichenko. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

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
        
        //Create toolbar and "Done" button
        let toolBar = UIToolbar()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(doneButtonTapped))
        
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        
        toolBar.sizeToFit()
        toolBar.setItems([flexibleSpace, doneButton], animated: false)
        
        redTextField.inputAccessoryView = toolBar
        greenTextField.inputAccessoryView = toolBar
        blueTextField.inputAccessoryView = toolBar
        
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        doneButtonTapped()
    }
    
    @IBAction func slidersAction() {
        let redValue = CGFloat(redSlider.value)
        let greenValue = CGFloat(greenSlider.value)
        let blueValue = CGFloat(blueSlider.value)

        finalColor.backgroundColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1)
        
        redValueLabel.text = String(format: "%.2f", redValue)
        greenValueLabel.text = String(format: "%.2f", greenValue)
        blueValueLabel.text = String(format: "%.2f", blueValue)
        
        redTextField.text = redValueLabel.text
        greenTextField.text = greenValueLabel.text
        blueTextField.text = blueValueLabel.text
    }
    
    
    @objc func doneButtonTapped() {
        
        view.endEditing(true)
        
        guard let redValueText = redTextField.text, !redValueText.isEmpty else { return }
        guard let greenValueText = greenTextField.text, !greenValueText.isEmpty else { return }
        guard let blueValueText = blueTextField.text, !blueValueText.isEmpty else { return }
        
        if let redValue = Float(redValueText){
            redSlider.value = redValue
            slidersAction()
        }
        if let greenValue = Float(greenValueText){
            greenSlider.value = greenValue
            slidersAction()
        }
        if let blueValue = Float(blueValueText){
            blueSlider.value = blueValue
            slidersAction()
        }
    }
}
 
