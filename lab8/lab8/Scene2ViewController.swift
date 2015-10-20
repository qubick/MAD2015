//
//  Scene2ViewController.swift
//  lab8
//
//  Created by Jeeeun Kim on 10/20/15.
//  Copyright (c) 2015 Jeeeun Kim. All rights reserved.
//

import UIKit

class Scene2ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var userArt: UITextField!
    @IBOutlet weak var userArtist: UITextField!
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "doneFavs" {
        
            var scene1ViewController:ViewController = segue.destinationViewController as! ViewController
            
            if userArtist.text.isEmpty == false {
                scene1ViewController.user.favArtist = userArtist.text
            }
            
            if userArt.text.isEmpty == false {
                scene1ViewController.user.favArt = userArt.text
            }
        }
    }
    override func viewDidLoad() {
        
        userArt.delegate = self
        userArtist.delegate = self
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
