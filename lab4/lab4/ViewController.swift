//
//  ViewController.swift
//  lab4
//
//  Created by JeeeunKim on 10/6/15.
//  Copyright (c) 2015 JeeeunKim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var delta = CGPointMake(12, 4)
    var nemoRadius = CGFloat()
    var timer = NSTimer()
    var translation = CGPointMake(0.0, 0.0)
    var angle:CGFloat = 0.0
    
    @IBOutlet weak var sliderLabel: UILabel!
    @IBOutlet weak var imgNemo: UIImageView!
    @IBOutlet weak var sliderSpeed: UISlider!
    @IBAction func sliderMoved(sender: UISlider) {
        timer.invalidate()
        changeSliderValue()
    }
    
    func changeSliderValue(){
        sliderLabel.text = String(format: "%.2f", sliderSpeed.value)
        timer = NSTimer.scheduledTimerWithTimeInterval(Double(sliderSpeed.value), target:self, selector:"moveImg", userInfo:nil, repeats: true)
    }
    
    func moveImg(){
        
        imgNemo.center = CGPointMake(imgNemo.center.x + delta.x, imgNemo.center.y + delta.y)
        
        if imgNemo.center.x > view.bounds.size.width - nemoRadius || imgNemo.center.x < nemoRadius {
            delta.x = -delta.x
        }
        
        if imgNemo.center.y > view.bounds.size.height - nemoRadius || imgNemo.center.y < nemoRadius {
            delta.y = -delta.y
        }
    }
    
    override func viewDidLoad() {
        
        nemoRadius = imgNemo.frame.size.width/2
        changeSliderValue()
        
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

