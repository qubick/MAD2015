//
//  ViewController.swift
//  lab4
//
//  Created by JeeeunKim on 10/6/15.
//  Copyright (c) 2015 JeeeunKim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var delta = CGPointMake(1, 12)
    var nemoRadius = CGFloat()
    var timer = NSTimer()
    var translation = CGPointMake(0.0, 0.0)
    var angle:CGFloat = 0.0
    var imgListArray : NSMutableArray = []
    
    
    @IBOutlet weak var sliderLabel: UILabel!
    @IBOutlet weak var imgNemo: UIImageView!
    @IBOutlet weak var sliderSpeed: UISlider!
    @IBAction func sliderMoved(sender: UISlider) {
        timer.invalidate()
        changeSliderValue()
    }
    
    func toggleDelta(){
        if delta == CGPoint(x: 1, y: 12) {
            delta = CGPoint(x: 12, y: 4)
        } else  {
            delta = CGPoint(x: 1, y: 12)
        }
    }
    func changeSliderValue(){
        sliderLabel.text = String(format: "%.2f", sliderSpeed.value)
        timer = NSTimer.scheduledTimerWithTimeInterval(Double(sliderSpeed.value), target:self, selector:"moveImg", userInfo:nil, repeats: true)
    }
    
    func moveImg(){
        let duration = Double(sliderSpeed.value)
        UIView.beginAnimations("nemo", context: nil)
        UIView.animateWithDuration(duration, animations: {
            self.imgNemo.transform = CGAffineTransformMakeTranslation(self.translation.x, self.translation.y)
            self.translation.x += self.delta.x
            self.translation.y += self.delta.y
        })
        UIView.commitAnimations()
        /*
        imgNemo.center = CGPointMake(imgNemo.center.x + delta.x, imgNemo.center.y + delta.y)
        
        if imgNemo.center.x > view.bounds.size.width - nemoRadius || imgNemo.center.x < nemoRadius {
            delta.x = -delta.x
        }
        
        if imgNemo.center.y > view.bounds.size.height - nemoRadius || imgNemo.center.y < nemoRadius {
            delta.y = -delta.y
        }
        */
        
        if imgNemo.center.x + translation.x > view.bounds.size.width - nemoRadius || imgNemo.center.x + translation.x < nemoRadius {
        
            delta.x = -delta.x
        }
        
        if imgNemo.center.y + translation.y > view.bounds.size.height - nemoRadius || imgNemo.center.y + translation.y < nemoRadius {
            
            delta.y = -delta.y
        }
    }
    
    override func viewDidLoad() {
        
        imgListArray.addObject(UIImage(named: "nemo1")!)
    
        imgListArray.addObject(UIImage(named: "nemo2")!)
        
        self.imgNemo.animationImages = imgListArray as [AnyObject]
        imgNemo.animationDuration = NSTimeInterval(1.0)
        self.imgNemo.startAnimating()
        
        nemoRadius = imgNemo.frame.size.width/2
        changeSliderValue()
        
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

