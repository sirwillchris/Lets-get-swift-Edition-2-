//
//  ViewController.swift
//  LGS E2
//
//  Created by William Christopher on 22/01/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    // Assigning Custom Function to Swift's Inbuilt Touch UI
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.backgroundColor = randomColorGenerator()
    }
    
    
    // Function to generate random color with RGB Values
    
    func randomColorGenerator() -> UIColor {
        
        let red = CGFloat(arc4random_uniform(256))/225.0
        let green = CGFloat(arc4random_uniform(256))/225.0
        let blue = CGFloat(arc4random_uniform(256))/225.0
        
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }

}


