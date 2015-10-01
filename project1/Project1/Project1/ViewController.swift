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
    var speed       :Float = 5.0 //default
    var imgTitle    :String = "android-gear1"
    
    var imgListArray: NSMutableArray = []
    var txtListArray: NSMutableArray = []
    
    var stopOrGo = 0
    
    @IBOutlet weak var DebugWindow: UITextField!
    
    @IBOutlet weak var imgSet: UIImageView!
    @IBOutlet weak var chooseBot: UISegmentedControl!
    
    @IBAction func changeImgSet(sender: UISegmentedControl) {
        
        //before check segment index, assign currently selected gearbox
        var geartype : String = "gear1" //1 for all 1st state img
        
        stopOrGo = 0
        toggleAnimation() //if animating, stop when the bot selection is changed
        
        switch numGearbox {
            case 0:
                imgTitle = "gear1"
            case 1:
                imgTitle = "crank1"
            case 2:
                imgTitle = "dcam1"
            default:
                checkSum = -1
        }
        
        if chooseBot.selectedSegmentIndex == 0 {
            currBot = 0
            imgTitle = "android-" + "\(imgTitle)"
        } else if chooseBot.selectedSegmentIndex == 1 {
            currBot = 1
            imgTitle = "finn-" + "\(imgTitle)"
        } else if chooseBot.selectedSegmentIndex == 2 {
            currBot = 2
            imgTitle = "adabot-" + "\(imgTitle)"
        } else {
            checkSum = -1
        }
        
        //set img view to selected image
        imgSet.image = UIImage(named: imgTitle)
    }
    
    @IBAction func changeSpeed(sender: UISlider) {
        speed = sender.value
        toggleAnimation()
    }
    
    @IBAction func btnChangeGear(sender: UIButton) {
        
        var bot :String = "android-" //default
        var geartype :String = "gear"

        stopOrGo = 0
        toggleAnimation()
        
        //numGearbox<2 ? numGearbox++ : numGearbox-2
        if numGearbox < 2 {
            numGearbox++
        } else {
            numGearbox -= 2
        }
        
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
                    //DebugWindow.text = "added hinge to back for supports"
                    //add alert for special situ
                }
            case 2:
                imgTitle = "\(bot)" + "dcam1"
            default:
                checkSum = -1
        }
        
        imgSet.image = UIImage(named: imgTitle)
        //gearLabel.text = geartype
        //DebugWindow.text = "\(numGearbox)"
    }
    
    @IBAction func btnSimulate(sender: UIButton) {
        
        var unitStr = "gear" //default
        var botStr = "android"
        var index = 6
        
        stopOrGo = 1 - stopOrGo //toggle whenever it's clicked
        
        //set string according to bot selection
        switch currBot {
            case 0:
                botStr = "android-"
            case 1:
                botStr = "finn-"
            case 2:
                botStr = "adabot-"
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
        
        for countValue in 1...index {
            imgTitle = "\(botStr)" + "\(unitStr)" + "\(countValue)"
            
            //debug
            //DebugWindow.text = imgTitle
            println(imgTitle)
            var image = UIImage(named: imgTitle)
            println(image)
            
            imgListArray.addObject(image!)
            
        }
        
        self.imgSet.animationImages = imgListArray as [AnyObject]
        toggleAnimation()

    }

    func toggleAnimation() {
        imgSet.animationDuration = NSTimeInterval(6.0 - speed) //toggle speed number
            //lower slide value(min.1) - lower simulation speed
            //high slide value(max.5) - simulation speed
        //DebugWindow.text = "\(6.0-speed)"
        if stopOrGo == 0 {
            self.imgSet.stopAnimating()
        } else if stopOrGo == 1 {
            self.imgSet.startAnimating()
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

