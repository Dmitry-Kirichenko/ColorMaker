//
//  ViewController.swift
//  Make Your Color
//
//  Created by Дмитрий Кириченко on 14.09.2020.
//  Copyright © 2020 Dmitry Kirichenko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  
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
    
    @IBOutlet var doneButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // View setup
        finalColor.layer.cornerRadius = 15
        
        //Button setup
        doneButton.layer.cornerRadius = 10
        
        // Slider's setup
        redSlider.tintColor = .red
        greenSlider.tintColor = .green
        
        setColor()
        setValueForLabel()
        setValueForTextField()
        
        addDoneButtonTo(redTextField)
        addDoneButtonTo(greenTextField)
        addDoneButtonTo(blueTextField)
    
    }

    // Change colors with sliders
    @IBAction func rgbSlider(_ sender: UISlider) {
        
        switch sender.tag {
        case 0:
            redValueLabel.text = string(from: sender)
            redTextField.text = string(from: sender)
        case 1:
            greenValueLabel.text = string(from: sender)
            greenTextField.text = string(from: sender)
        case 2:
            blueValueLabel.text = string(from: sender)
            blueTextField.text = string(from: sender)
        default:
            break
        }
        
        setColor()
    }
    
    // Color of view
    private func setColor() {
        finalColor.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                             green: CGFloat(greenSlider.value),
                                             blue: CGFloat(blueSlider.value),
                                             alpha: 1)
    }
    
    // String value of RGB
    private func string(from slider: UISlider) -> String {
        return String(format: "%.2f", slider.value)
    }
    
    private func setValueForLabel() {
        redValueLabel.text = string(from: redSlider)
        greenValueLabel.text = string(from: greenSlider)
        blueValueLabel.text = string(from: blueSlider)
    }
    
    private func setValueForTextField() {
        redTextField.text = string(from: redSlider)
        greenTextField.text = string(from: greenSlider)
        blueTextField.text = string(from: blueSlider)
    }
    
}

extension ViewController: UITextFieldDelegate {
    
    // Hides the keyboard when the "Done" button is pressed
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // Hides keyboard on tap outside Text View area
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        view.endEditing(true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        guard let text = textField.text else { return }
        
        if let currentValue = Float(text) {
            
            switch textField.tag {
            case 0: redSlider.value = currentValue
            case 1: greenSlider.value = currentValue
            case 2: blueSlider.value = currentValue
            default: break
            }
            
            setColor()
            setValueForLabel()
        } else {
            showAlert(title: "Wrong format",
                      message: "Please enter correct value")
        }
    }
}

extension ViewController {
    
    // Add "Done" button on keyboard
    private func addDoneButtonTo(_ textField: UITextField) {
        
        let keyboardToolbar = UIToolbar()
        textField.inputAccessoryView = keyboardToolbar
        keyboardToolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done",
                                         style: .done,
                                         target: self,
                                         action: #selector(didTapDone))
        
        let flexBarButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                            target: nil,
                                            action: nil)
        
        keyboardToolbar.items = [flexBarButton, doneButton]
    }
    
    @objc private func didTapDone() {
        view.endEditing(true)
    }
    
    private func showAlert(title: String, message: String) {
        
        let alert = UIAlertController(title: title, message: message,
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default)
        
        alert.addAction(okAction)
        present(alert, animated: true)

    }
}
