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
    
    @IBOutlet weak var totalDuePerPerson: UILabel!
    
    func updateTipTotals(){
        let curFormatter        = NSNumberFormatter()
        
        if let amout       = NSNumberFormatter().numberFromString(checkAmout.text!)!.floatValue {
            amout = 0.0
        }
        //(checkAmout.text as String?).toFloat
        let pct         = NSNumberFormatter().numberFromString(tipPercent.text!)!.floatValue
        //(tipPercent.text as String?).floatValue/100
        let numOfPeople = NSNumberFormatter().numberFromString(people.text!)!.integerValue
        //Int(people.text)
        
        let tip         = amout * pct
        let total       = amout + tip
        var personTotal : Float = 0.0
        if numOfPeople > 0 {
            personTotal = total / Float(numOfPeople)
        }
        
        
        //creat curForm obj. from NSFormatter class
        curFormatter.numberStyle = NSNumberFormatterStyle.CurrencyStyle
        tipDue.text             = curFormatter.stringFromNumber(tip)
        totalDue.text           = curFormatter.stringFromNumber(total)
        totalDuePerPerson.text  = curFormatter.stringFromNumber(personTotal)
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

