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
        acbutton.layer.cornerRadius = 20
        randbutton.layer.cornerRadius = 20
         pibutton.layer.cornerRadius = 20
         xybutton.layer.cornerRadius = 20
         xbutton.layer.cornerRadius = 20
         probutton.layer.cornerRadius = 20
         rootbutton.layer.cornerRadius = 20
         dividebutton.layer.cornerRadius = 20
         sevenbutton.layer.cornerRadius = 20
         eightbutton.layer.cornerRadius = 20
         ninebutton.layer.cornerRadius = 20
         fourbutton.layer.cornerRadius = 20
         fivebutton.layer.cornerRadius = 20
         sixbutton.layer.cornerRadius = 20
         onebutton.layer.cornerRadius = 20
         twobutton.layer.cornerRadius = 20
         threebutton.layer.cornerRadius = 20
         zerobutton.layer.cornerRadius = 20
         multibutton.layer.cornerRadius = 20
         minusbutton.layer.cornerRadius = 20
         equalbutton.layer.cornerRadius = 20
         plusbutton.layer.cornerRadius = 20
        
        
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}


