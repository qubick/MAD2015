//
//  ViewController.swift
//  lab4
//
//  Created by JeeeunKim on 10/6/15.
//  Copyright (c) 2015 JeeeunKim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var sliderLabel: UILabel!
    @IBOutlet weak var imgNemo: UIImageView!
    @IBOutlet weak var sliderSpeed: UISlider!
    @IBAction func sliderMoved(sender: UISlider) {
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

