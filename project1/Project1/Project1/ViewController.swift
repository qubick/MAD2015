//
//  ViewController.swift
//  Project1
//
//  Created by JeeeunKim on 9/27/15.
//  Copyright (c) 2015 JeeeunKim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var numGearbox  :Int = 0
    var currBot     :Int = 0 //android as default
    var checkSum    :Int = 0
    var speed       :Float = 1.0
    
    @IBOutlet weak var imgSet: UIImageView!
    @IBOutlet weak var chooseBot: UISegmentedControl!
    
    @IBAction func changeImgSet(sender: UISegmentedControl) {
        
        if chooseBot.selectedSegmentIndex == 0 {
            currBot = 0
        }
        else if chooseBot.selectedSegmentIndex == 1 {
            currBot = 1
        }
        else if chooseBot.selectedSegmentIndex == 2 {
            currBot = 2
        }
    }
    
    @IBAction func changeSpeed(sender: UISlider) {
        speed = sender.value
    }
    
    @IBAction func btnChangeGear(sender: UIButton) {
        
        numGearbox<3 ? numGearbox++ : 0 //when 3 kinds
        //change img set in sequence
        //reset max num
    }
    
    @IBAction func btnSimulate(sender: UIButton) {
        
        //change imgset according to gearbox
        switch currBot {
            case 0:
                //load android imgset
                //loop imgset 
                //delay((5-speed)*100)
                checkSum = 0
            case 1:
                //load finn imgset
                checkSum = 1
            case 2:
                //load adabot imgset
                checkSum = 2
            default:
                checkSum = -1
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

