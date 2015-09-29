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
    
    @IBOutlet weak var DebugWindow: UITextField!
    
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
        
        DebugWindow.text = "test"
        
        var unitStr = "gear" //default
        var botStr = "android"
        
        
        //set string according to bot selection
        switch currBot {
        case 0:
            botStr = "android-"
            checkSum = 0
        case 1:
            botStr = "finn-"
            checkSum = 1
        case 2:
            botStr = "adabot-"
            checkSum = 2
        default:
            checkSum = -1
        }
        
        //set string according to unit selection
        switch numGearbox {
            case 0:
                unitStr = "gear"
            case 1:
                unitStr = "crank"
            case 2:
                unitStr = "doublecam"
            default:
                checkSum = -1
        }
        
        let seconds = 4.0
        let delay = seconds * Double(NSEC_PER_SEC)  // nanoseconds per seconds
        var dispatchTime = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
        
        var imgTitle = "finn-gear"
        
        for i in 0...6 {
        
            dispatch_after(dispatchTime, dispatch_get_main_queue(), {
                
                imgTitle = "\(botStr)" + "\(unitStr)" + "\(i)"
                self.imgSet.image = UIImage(named:"\(imgTitle)")
                self.DebugWindow.text = imgTitle
                
            })
            
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

