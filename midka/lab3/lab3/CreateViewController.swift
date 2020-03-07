//
//  CreateViewController.swift
//  lab3
//
//  Created by Sultan Daurenbek on 2/29/20.
//  Copyright © 2020 Sultan Daurenbek. All rights reserved.
//

import UIKit

class CreateViewController: UIViewController {
    


    
     var choosecolor:UIColor!
    
    
    
    
    

    
     var onSelect: ((UIColor) -> Void)? = nil
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
     

        // Do any additional setup after loading the view.
    }
    

    @IBAction func colorSelected(_ sender: UIButton) {
        if sender.titleLabel?.text == "Red" {
            self.onSelect?(UIColor.red)
        } else {
            self.onSelect?(UIColor.blue)
        }
        
        self.navigationController?.popViewController(animated: true)


        
    }
         
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


