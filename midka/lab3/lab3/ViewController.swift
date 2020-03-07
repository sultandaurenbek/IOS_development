//
//  ViewController.swift
//  lab3
//
//  Created by Sultan Daurenbek on 2/29/20.
//  Copyright © 2020 Sultan Daurenbek. All rights reserved.
//

import UIKit



class ViewController: UIViewController {

    @IBOutlet weak var someView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

 
         
        
        }
    
    
    @IBAction func drawColor(_ sender: UIButton) {

             let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    guard
             let selectVC = storyboard.instantiateViewController(identifier: "createview") as? CreateViewController
                    else { return }
        navigationController?.pushViewController(selectVC, animated: true)
     
        selectVC.onSelect={ [weak sender] color in
      
        
            sender?.backgroundColor = color
        
        
    }
    
  
    
   
  
}
}
