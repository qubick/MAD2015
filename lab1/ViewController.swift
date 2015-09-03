//
//  ViewController.swift
//  lab1
//
//  Created by Jeeeun Kim on 9/1/15.
//  Copyright (c) 2015 Jeeeun Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var botImage: UIImageView!
    
    @IBOutlet weak var messageText: UILabel!
    
    @IBAction func lookAndroid(sender: UIButton) {
        if sender.tag == 1{
            botImage.image = UIImage(named: "android.png")
            messageText.text = "Android"
        }
        else if sender.tag == 2{
            botImage.image = UIImage(named: "danbo.png")
            messageText.text = "Danbo"
        }
        else if sender.tag == 3{
            botImage.image = UIImage(named: "aidabot.png")
            messageText.text = "AidaBot"
        }
        else {
            botImage.image = UIImage(named: "minion.png")
            messageText.text = "Minion"
        }
    }
    
    @IBOutlet weak var labelIndicator: UILabel!
    
    @IBAction func goWeb(sender: UIButton) {
        botImage.image = nil
        labelIndicator.text = "Uh uh, maybe next time..."
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

