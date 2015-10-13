//
//  ViewController.swift
//  gesture
//
//  Created by JeeeunKim on 10/13/15.
//  Copyright (c) 2015 JeeeunKim. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {

    @IBAction func handlePan(sender: UIPanGestureRecognizer) {
        let translation = sender.translationInView(view)
        sender.view!.center = CGPoint(x: sender.view!.center.x + translation.x, y:sender.view!.center.y + translation.y)
        sender.setTranslation(CGPointZero, inView: view)
        
        if sender.state  == UIGestureRecognizerState.Ended {
            let velocity = sender.velocityInView(self.view)
            let magnitude = sqrt((velocity.x * velocity.x) + (velocity.y * velocity.y))
            let slideMultiplier = magnitude / 200
            let sliderFactor = 0.1 * slideMultiplier
            var finalPoint = CGPoint(x:sender.view!.center.x + (velocity.x * sliderFactor), y:sender.view!.center.y + (velocity.y * sliderFactor))
            
            finalPoint.x = min(max(finalPoint.x, 0), self.view.bounds.size.width)
            finalPoint.y = min(max(finalPoint.x, 0), self.view.bounds.size.height)
            
            UIView.animateWithDuration(Double(sliderFactor * 2), delay:0,options:UIViewAnimationOptions.CurveEaseOut, animations: {sender.view!.center = finalPoint}, completion:nil)
        }
    }
    
    @IBAction func handlePinch(sender: UIPinchGestureRecognizer) {
        sender.view!.transform = CGAffineTransformScale(sender.view!.transform, sender.scale, sender.scale)
        sender.scale = 1
    }
    
    @IBAction func handleRotate(sender: UIRotationGestureRecognizer) {
        sender.view!.transform = CGAffineTransformRotate(sender.view!.transform, sender.rotation)
    }
    
    func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldBeRequiredToFailByGestureRecognizer otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
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

