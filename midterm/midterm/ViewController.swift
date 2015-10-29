//
//  ViewController.swift
//  midterm
//
//  Created by Jeeeun Kim on 10/29/15.
//  Copyright (c) 2015 Jeeeun Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    var delta = CGPointMake(3, 0)
    var radius = CGFloat()
    var timer = NSTimer()
    var translation = CGPointMake(0.0, 0.0)
    
    @IBOutlet weak var dailyMiles: UITextField!
    @IBOutlet weak var currentGallons: UILabel!
    @IBOutlet weak var onOffMonthly: UISwitch!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var segmentRide: UISegmentedControl!

    @IBOutlet weak var monthly1: UILabel!
    @IBOutlet weak var monthly2: UILabel!
    @IBOutlet weak var monthly3: UILabel!
    
    @IBOutlet weak var totaltime: UILabel!
    @IBOutlet weak var totalGallons: UILabel!
    @IBOutlet weak var imgRide: UIImageView!
    
    @IBAction func toggleMonth(sender: UISwitch) {
        calculate()
    }
    
    @IBAction func slideGallons(sender: UISlider) {
        let oil = sender.value
        println(oil)
        currentGallons.text = String(format:"%.2f", oil)
    }
    
    @IBAction func chooseRide(sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0: //car
            imgRide.image = UIImage(named: "car")
                    case 1: //bus
            imgRide.image = UIImage(named: "bus")
        case 2: //bike
            imgRide.image = UIImage(named: "bike")
        default:
            println("this cannot be happened")
        }
        calculate()
    }
    
    @IBAction func calculate(sender: UIButton) {
        calculate()
    }
    
    func calculate() {
    
        var myAlert = UIAlertView()
        var totalMile:Float?
        let curFormatter = NSNumberFormatter()
        let miles = (dailyMiles.text as NSString).floatValue
        
        switch segmentRide.selectedSegmentIndex {
        case 0: //car
             totalMile = miles/20*60 //when average speed is 20mph
            
             myAlert.title = "Suggestion for you!"
             myAlert.message = "Why don't you try Carpool?"
             myAlert.addButtonWithTitle("OK")

        case 1: //bus
            totalMile = miles/12*60 + 5*2 //wait 5min each way for round trip
        case 2: //bike
            totalMile = miles/10*60
        default:
            println("this should not happens")
        }
        
        
        let gallons = (dailyMiles.text as NSString).floatValue
        //let current = curFormatter.numberFromString(currentGallons.text!)
        var totalGallon = gallons/24 //- current//when average efficiency is 24 mpg
        
        if segmentRide.selectedSegmentIndex == 1 || segmentRide.selectedSegmentIndex == 2 {
            totalGallon = 0.0
        } else {
            myAlert.show()
        }
        
        curFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        totaltime.text = curFormatter.stringFromNumber(totalMile!)
        totalGallons.text = curFormatter.stringFromNumber(totalGallon)
        
        if onOffMonthly.on {
            let monthCommute = totalMile!*20/60 //20days work, in hour
            monthly1.text = "Monthly Hour"
            monthly2.text = curFormatter.stringFromNumber(monthCommute)
            monthly3.text = "hours"
            
        } else {
            monthly1.text = ""
            monthly2.text = ""
            monthly3.text = ""
        }
        
        
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        calculate()
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func viewDidLoad() {
        dailyMiles.delegate = self
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

