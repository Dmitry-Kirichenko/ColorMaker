//
//  FirstViewController.swift
//  ColorMaker
//
//  Created by Дмитрий Кириченко on 11.11.2020.
//  Copyright © 2020 Dmitry Kirichenko. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let secondVC = segue.destination as! SecondViewController
        secondVC.colorFromFirstVC = view.backgroundColor
        print("go to secondVC")
    }

    
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
        let secondVC = segue.source as! SecondViewController
        secondVC.delegate = self
        secondVC.setColor()        
    }
}

extension FirstViewController: ColorDelegate {
    func setColor(_ color: UIColor) {
        view.backgroundColor = color
    }
    
}


