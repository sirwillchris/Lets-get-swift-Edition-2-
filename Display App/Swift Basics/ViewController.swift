//
//  ViewController.swift
//  Swift Basics
//
//  Created by William Christopher on 24/02/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var clickme: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Creating Constants and Variables
    
        let firstName = "Your First Name "
        
        var secondName = "NA "
        
        secondName = "Your Second Name"
        
        // Printing objects with String concatenation
        
        print("Hello,\(firstName + secondName), this code works")
        
        // Creating a Text label
        
        let newLabel = UILabel()
        
        // Assigning Variable to aN UI Label
        
        newLabel.text = "Hey \(firstName + secondName) Welcome to Lets get swifty Edition 2!!"
        
        // Setting visual parameters
        newLabel.font = UIFont.systemFont(ofSize: 30)
        
        newLabel.textColor = .white
        
        newLabel.frame = CGRect(x: 20,
                                y: 109,
                                width: 300,
                                height: 1200)
        
        view.addSubview(newLabel)
        
        newLabel.numberOfLines = 6
        // Adding the label to UI Main View
        
        // Create a new UIView instance
        let myView = UIView()

        // Set the frame of the view to fill the entire screen
        myView.frame = UIScreen.main.bounds

        // Set the background color of the view
        myView.backgroundColor = UIColor.black

        // Add the view to the main view controller's view
        view.addSubview(myView)
        
        view.addSubview(newLabel)
        
        
        
    
        
        // Do any additional setup after loading the view.
    }


}

