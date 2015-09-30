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
    var imgTitle    :String = "android-gear1"
    
    var imgListArray: NSMutableArray = []
    var txtListArray: NSMutableArray = []
    
    var stopOrGo = 0
    
    @IBOutlet weak var DebugWindow: UITextField!
    
    @IBOutlet weak var imgSet: UIImageView!
    @IBOutlet weak var chooseBot: UISegmentedControl!
    
    @IBAction func changeImgSet(sender: UISegmentedControl) {
        
        if chooseBot.selectedSegmentIndex == 0 {
            currBot = 0
            DebugWindow.text = "android selected"
            imgSet.image = UIImage(named: "android-gear1") //should check gear type
        }
        else if chooseBot.selectedSegmentIndex == 1 {
            currBot = 1
            DebugWindow.text = "finn selected"
            imgSet.image = UIImage(named: "finn-gear1")
        }
        else if chooseBot.selectedSegmentIndex == 2 {
            currBot = 2
            DebugWindow.text = "adabot selected"
            imgSet.image = UIImage(named: "adabot-gear1")
        }
    }
    
    @IBAction func changeSpeed(sender: UISlider) {
        speed = sender.value
    }
    
    @IBAction func btnChangeGear(sender: UIButton) {
        
        self.imgSet.stopAnimating()
        stopOrGo = 0
        
        //numGearbox<2 ? numGearbox++ : numGearbox-2
        if numGearbox < 2 {
            numGearbox++
        } else {
            numGearbox -= 2
        }
        
        var bot = "android-"
        switch currBot {
            case 0:
                bot = "android-"
            case 1:
                bot = "finn-"
            case 2:
                bot = "adabot-"
            default:
                checkSum = -1
            
        }
        
        switch numGearbox {
            case 0:
                imgTitle = "\(bot)" + "gear1"
            case 1:
                imgTitle = "\(bot)" + "crank1"
                if currBot == 1 { //if android
                    DebugWindow.text = "added hinge to back for supports"
                    //add alert
                }
            case 2:
                imgTitle = "\(bot)" + "dcam1"
            default:
                checkSum = -1
        }
        
        imgSet.image = UIImage(named: imgTitle)
        DebugWindow.text = "\(numGearbox)"
    }
    
    @IBAction func btnSimulate(sender: UIButton) {
        
        DebugWindow.text = "test"
        
        var unitStr = "gear" //default
        var botStr = "android"
        var index = 6
        
        stopOrGo = 1 - stopOrGo
        
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
                imgListArray.removeAllObjects() //first clear the array elements
                unitStr = "gear"
                index = 6
            case 1:
                imgListArray.removeAllObjects()
                unitStr = "crank"
                index = 6
            case 2:
                imgListArray.removeAllObjects()
                unitStr = "dcam"
                index = 8
            default:
                checkSum = -1
        }
 /*
        let delayInSeconds = 1.0 //get from slider
        let delayInNanoSeconds = dispatch_time(DISPATCH_TIME_NOW,
            Int64(delayInSeconds * Double(NSEC_PER_SEC)))
        
        let concurrentQueue =
        dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
        
        for i in 1...6 {
            
            //delay in NanoSeconds
            dispatch_after(delayInNanoSeconds, concurrentQueue, {
                
                self.imgTitle = "\(botStr)" + "\(unitStr)" + "\(i)"
                
                self.imgSet.image = UIImage(named:"\(self.imgTitle)")
                self.DebugWindow.text = self.imgTitle
            
            //sleep(100)
            })
        }
*/
        for countValue in 1...index {
            imgTitle = "\(botStr)" + "\(unitStr)" + "\(countValue)"
            
            //debug
            DebugWindow.text = imgTitle
            println(imgTitle)
            var image = UIImage(named: imgTitle)
            println(image)
            
            imgListArray.addObject(image!)
            
            
        }
        
        self.imgSet.animationImages = imgListArray as [AnyObject]
        self.imgSet.animationDuration = 2.0 //should get from slider value
        
        if stopOrGo == 1 {
            self.imgSet.startAnimating()
        } else if stopOrGo == 0 {
            self.imgSet.animationDuration = 0.0
            self.imgSet.stopAnimating()
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

