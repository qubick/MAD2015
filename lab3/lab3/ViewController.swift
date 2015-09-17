//
//  ViewController.swift
//  lab3
//
//  Created by JeeeunKim on 9/17/15.
//  Copyright (c) 2015 JeeeunKim. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {


    @IBOutlet weak var checkAmout: UITextField!
    @IBOutlet weak var tipPercent: UITextField!
    @IBOutlet weak var people: UITextField!
    
    @IBOutlet weak var tipDue: UILabel!
    @IBOutlet weak var totalDue: UILabel!
    @IBOutlet weak var totalDuerPerPerson: UILabel!
    
    func updateTipTotals(){
        
        let amout       = (checkAmout.text as NSString).floatValue
        let pct         = (tipPercent.text as NSString).floatValue/100
        let numOfPeople = people.text.toInt()
        let tip         = amout * pct
        let total       = amout + tip
        var personTotal : Float = 0.0
        if numOfPeople != nil {
            if numOfPeople! > 0 {
                personTotal = total / Float(numOfPeople!)
            }
        }
        
        var curFormatter        = NSNumberFormatter()
        //creat curForm obj. from NSFormatter class
        curFormatter.numberStyle = NSNumberFormatterStyle.CurrencyStyle
        tipDue.text             = curFormatter.stringFromNumber(tip)
        totalDue.text           = curFormatter.stringFromNumber(total)
        totalDuerPerPerson.text  = curFormatter.stringFromNumber(personTotal)
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        updateTipTotals()
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    override func viewDidLoad() {
        checkAmout.delegate = self
        tipPercent.delegate = self
        people.delegate = self
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

