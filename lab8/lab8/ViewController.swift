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
    
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue){
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

