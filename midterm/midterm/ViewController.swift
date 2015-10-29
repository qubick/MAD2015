//
//  ViewController.swift
//  midterm
//
//  Created by Jeeeun Kim on 10/29/15.
//  Copyright (c) 2015 Jeeeun Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var currentGallons: UILabel!
    @IBOutlet weak var totaltime: UILabel!
    @IBOutlet weak var totalGallons: UILabel!
    @IBOutlet weak var imgRide: UIImageView!
    
    
    @IBAction func typeMiles(sender: UITextField) {
    }
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
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

