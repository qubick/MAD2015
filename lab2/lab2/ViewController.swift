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
    
    @IBOutlet weak var imgControl: UISegmentedControl!
    @IBAction func ChangeInfo(sender: UISegmentedControl) {
        
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
    
    @IBOutlet weak var imgControl2: UISegmentedControl!
    @IBAction func ChangeInfo2(sender: AnyObject) {
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
    
    @IBOutlet weak var capitalSwitch: UISwitch!
    @IBAction func updateFont(sender: UISwitch) {
        
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

