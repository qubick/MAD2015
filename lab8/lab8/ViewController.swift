//
//  ViewController.swift
//  lab8
//
//  Created by Jeeeun Kim on 10/20/15.
//  Copyright (c) 2015 Jeeeun Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var imgArt: UIImageView!
    @IBOutlet weak var answerCorrect: UILabel!
    
    var user = Favorite()
    var correct:Bool = false
    var answerAList = ["Starry Starry Night", "Starry Starry Night ", "starry starry night", "starry starry night ", "Starry starry night", "Starry starry night ", "Starry starry night", "Starry starry night "]
    var answerBList = ["Vincent", "vincent", "Vincent Van Gogh", "Vincent van Gogh", "Vincent van gogh", "Van Gogh", "Van gogh", "Gogh", "goh", "Vincent ", "vincent ", "Vincent Van Gogh ", "Vincent van Gogh ", "Vincent van gogh ", "Van Gogh ", "Van gogh ", "Gogh ", "goh "]
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue){
        
        let answerA = user.favArt
        let answerB = user.favArtist
        
        for i in 0...3 {
            if answerA == answerAList[i] {
                for j in 0...7 {
                    if answerB == answerBList[j] {
                        correct = true
                        break
                    }
                }
            }
        }
        
        titleLabel.text = user.favArt
        artistLabel.text = user.favArtist
        
        if correct == true {
            answerCorrect.textColor = UIColor.greenColor()
            answerCorrect.text = "Correct!"
            correct = false
        } else {
            answerCorrect.textColor = UIColor.redColor()
            answerCorrect.text = "Try Again"
            correct = false
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

