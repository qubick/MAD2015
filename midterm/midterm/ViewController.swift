//
//  ViewController.swift
//  midterm
//
//  Created by Jeeeun Kim on 10/29/15.
//  Copyright (c) 2015 Jeeeun Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var dailyMiles: UITextField!
    @IBOutlet weak var currentGallons: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var segmentRide: UISegmentedControl!
    @IBOutlet weak var totaltime: UILabel!
    @IBOutlet weak var totalGallons: UILabel!
    @IBOutlet weak var imgRide: UIImageView!
    
    
    @IBAction func onOffMonthly(sender: UISwitch) {
    }
    @IBAction func slideGallons(sender: UISlider) {
        let oil = sender.value
        println(oil)
        currentGallons.text = String(format:"%.0f", oil)
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
    
        var totalMile:Float?
        let curFormatter = NSNumberFormatter()
        let miles = (dailyMiles.text as NSString).floatValue
        
        switch segmentRide.selectedSegmentIndex {
        case 0: //car
             totalMile = miles/20*60 //when average speed is 20mph
        case 1: //bus
            totalMile = miles/12*60 + 5
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
        }
        curFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        totaltime.text = curFormatter.stringFromNumber(totalMile!)
        totalGallons.text = curFormatter.stringFromNumber(totalGallon)
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

