//
//  ViewController.swift
//  Calculator
//
//  Created by Sultan Daurenbek on 1/25/20.
//  Copyright © 2020 Sultan Daurenbek. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
        let model = Calculator()
 
    @IBOutlet weak var answer: UILabel!
    
    @IBOutlet weak var acbutton: UIButton!
    @IBOutlet weak var randbutton: UIButton!
    @IBOutlet weak var pibutton: UIButton!
    @IBOutlet weak var xybutton: UIButton!
    @IBOutlet weak var xbutton: UIButton!
    @IBOutlet weak var probutton: UIButton!
    @IBOutlet weak var rootbutton: UIButton!
    @IBOutlet weak var dividebutton: UIButton!
    @IBOutlet weak var sevenbutton: UIButton!
    @IBOutlet weak var eightbutton: UIButton!
    @IBOutlet weak var ninebutton: UIButton!
    @IBOutlet weak var fourbutton: UIButton!
    @IBOutlet weak var fivebutton: UIButton!
    @IBOutlet weak var sixbutton: UIButton!
    @IBOutlet weak var onebutton: UIButton!
    @IBOutlet weak var twobutton: UIButton!
    @IBOutlet weak var threebutton: UIButton!
    @IBOutlet weak var zerobutton: UIButton!
    @IBOutlet weak var multibutton: UIButton!
    @IBOutlet weak var minusbutton: UIButton!
    @IBOutlet weak var equalbutton: UIButton!
    @IBOutlet weak var plusbutton: UIButton!
    
    
    
    
    
    
    
    
    @IBAction func numbers(_ sender: UIButton) {
             
      guard
      
        let numberText = sender.titleLabel?.text
        
             else
      {
        return
      }
    
             answer.text?.append(numberText)
 
       
    }
 
    @IBAction func actions(_ sender: UIButton) {
      
        
        // Button AC
        if sender.tag == 10
        {
            answer.text = ""
            model.clear()
        }
      
       // General case
       guard
           let numberText =  answer.text,
           let number = Double(numberText),
           let operation = sender.titleLabel?.text
     
       
       else
       {
        return
       }
     
      answer.text = ""
   
       model.setOperand(number: number)
            
       model.executeOperation(symbol: operation)
   
       
      if(checkingForUnary(comand: operation)){
        answer.text = String(model.result)
      }
   
    
        
    }
    //Function for checking  unary operations
    func checkingForUnary(comand: String) -> Bool
    {
        if(comand != "/" && comand != "*" && comand != "+" && comand != "x^y" && comand != "-")
    {
        return true
    }
        return false
    }
    
   /* func checkingForConstant(comands:String) ->Bool
    {
        if(comands == "pi" || comands == "rand")
           {
               return true
           }
               return false
    }
    */

    
       override func viewDidLoad() {
        // Design making circle buttons
        acbutton.layer.cornerRadius = 30
        randbutton.layer.cornerRadius = 30
         pibutton.layer.cornerRadius = 30
         xybutton.layer.cornerRadius = 30
         xbutton.layer.cornerRadius = 30
         probutton.layer.cornerRadius = 30
         rootbutton.layer.cornerRadius = 30
         dividebutton.layer.cornerRadius = 30
         sevenbutton.layer.cornerRadius = 30
         eightbutton.layer.cornerRadius = 30
         ninebutton.layer.cornerRadius = 30
         fourbutton.layer.cornerRadius = 30
         fivebutton.layer.cornerRadius = 30
         sixbutton.layer.cornerRadius = 30
         onebutton.layer.cornerRadius = 30
         twobutton.layer.cornerRadius = 30
         threebutton.layer.cornerRadius = 30
         zerobutton.layer.cornerRadius = 30
         multibutton.layer.cornerRadius = 30
         minusbutton.layer.cornerRadius = 30
         equalbutton.layer.cornerRadius = 30
         plusbutton.layer.cornerRadius = 30
        
        
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}


