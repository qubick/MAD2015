//
//  MyCustomButton.swift
//  project2
//
//  Created by JeeeunKim on 10/5/15.
//  Copyright (c) 2015 JeeeunKim. All rights reserved.
//

import Foundation
import UIKit

class MyWhiteButton: UIButton {
    required init(coder aDecoder: NSCoder!) {
        let colorImage = UIGraphicsGetImageFromCurrentImageContext()
        
        super.init(coder: aDecoder)
        self.layer.cornerRadius = 5.0
        self.layer.borderColor = UIColor.blackColor().CGColor
        self.layer.borderWidth = 1.0
        self.backgroundColor = UIColor.whiteColor()
        self.tintColor = UIColor.redColor()
    }
}

class MyBlackButton: UIButton {
    required init(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
        self.layer.cornerRadius = 6.0
        self.layer.borderColor = UIColor.blackColor().CGColor
        self.layer.borderWidth = 1.5
        self.backgroundColor = UIColor.blackColor()
        self.tintColor = UIColor.whiteColor()
    }
}