//
//  CreateViewController.swift
//  lab3
//
//  Created by Sultan Daurenbek on 2/29/20.
//  Copyright © 2020 Sultan Daurenbek. All rights reserved.
//

import UIKit

class CreateViewController: UIViewController {
    
    @IBOutlet weak var widthText: UITextField!
    @IBOutlet weak var heightText: UITextField!
    @IBOutlet weak var xcordText: UITextField!
    @IBOutlet weak var ycordText: UITextField!
    
    @IBOutlet var colorOfButtons: [UIButton]!
     var choosecolor:UIColor!
    var selectedView: UIView?
    override func viewDidLoad() {
         super.viewDidLoad()
        
   Navbutton()
}
    func Navbutton(){
           
              let addButton = UIBarButtonItem(title: "save", style: .plain, target: self, action: #selector(addframe))
              navigationItem.rightBarButtonItems = [ addButton]
             
       }

    @IBAction func colorDetect(_ sender: UIButton) {
        
        colorOfButtons.forEach{(button) in
            if button == sender{
                button.isSelected=true
            }
            else{
                button.isSelected=false
            }
        }
        guard let btncolor = sender.backgroundColor else {return}
         choosecolor = btncolor
        
    }
    
    var onSelect: ((_ widthText:Double, _ heightText: Double, _ xcordText:Double, _ ycordText:Double, _ chooosecolor:UIColor) -> Void)? = nil


    
    @objc func addframe() {
        
        guard let width = widthText.text, let height = heightText.text, let x = xcordText.text, let y = ycordText.text, let color = choosecolor else {
            let alert = UIAlertController(title: "Error", message: "Please write all data!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Done, frame added", style: .default, handler: nil))
            self.present(alert, animated: true)
            return
        }
        
        guard let realwidth = Double(width), let realheight = Double(height), let realx = Double(x), let realy = Double(y) else {
            let alert = UIAlertController(title: "Error", message: "Data type conflict", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Everything OK", style: .default, handler: nil))
            self.present(alert, animated: true)
            return
        }
        let screenSizeofView = UIScreen.main.bounds
        if CGFloat(realwidth) > screenSizeofView.width || CGFloat(realheight) > screenSizeofView.height {
            let alert = UIAlertController(title: "Error", message: "Data is bigger than Mainview", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true)
            return
        }
        
        guard let figure = selectedView else {
            onSelect?(realwidth, realheight, realx, realy, choosecolor)
            self.navigationController?.popViewController(animated: true)
            return
        }
        
       figure.backgroundColor = color
        figure.frame = CGRect(x: CGFloat(realx), y: CGFloat(realy), width: CGFloat(realwidth), height: CGFloat(realheight))
        
self.navigationController?.popViewController(animated: true)
    }
   
    
       
      
    }


