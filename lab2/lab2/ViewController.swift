//
//  ViewController.swift
//  lab2
//
//  Created by Jeeeun Kim on 9/10/15.
//  Copyright (c) 2015 Jeeeun Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var coupleImg: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    func updateImage1(){
        if imgControl.selectedSegmentIndex == 0{
            titleLabel.text = "See through her body"
            coupleImg.image = UIImage(named: "her.png")
        }
        else if imgControl.selectedSegmentIndex == 1 {
            titleLabel.text = "See through his body"
            coupleImg.image = UIImage(named: "him.png")
        }
        else {
            titleLabel.text = "Can this happen?"
        }
    }
    @IBOutlet weak var imgControl: UISegmentedControl!
    @IBAction func ChangeInfo(sender: UISegmentedControl) {
        updateImage1()
        updateCaps()
    }
    
    func updateImage2(){
        if imgControl2.selectedSegmentIndex == 0 {
            titleLabel.text = "Just sitting.."
            coupleImg.image = UIImage(named: "couple1.png")
        }
        else if imgControl2.selectedSegmentIndex == 1 {
            titleLabel.text = "Now kissing!"
            coupleImg.image = UIImage(named: "couple2.png")
        }
        else {
            titleLabel.text = "Can this happen?"
        }
    }
    @IBOutlet weak var imgControl2: UISegmentedControl!
    @IBAction func ChangeInfo2(sender: AnyObject) {
        updateImage2()
        updateCaps()
    }
    
    func updateCaps(){
        if capitalSwitch.on{
            titleLabel.text = titleLabel.text?.uppercaseString
        } else {
            titleLabel.text = titleLabel.text?.lowercaseString
        }
    }
    
    @IBOutlet weak var capitalSwitch: UISwitch!
    @IBAction func updateFont(sender: UISwitch) {
        updateCaps()
    }
    
    
    @IBOutlet weak var fontSizeLabel: UILabel!
    @IBAction func changeFontSize(sender: UISlider) {
        let fontSize = sender.value
        fontSizeLabel.text = String(format: "$.0f", fontSize)
        let fontSizeCGFloat = CGFloat(fontSize)
        titleLabel.font = UIFont.systemFontOfSize(fontSizeCGFloat)
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

