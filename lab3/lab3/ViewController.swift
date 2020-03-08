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
        @IBAction func createData(_ sender: Any) {
            
      CreateView()
      
    }
    
    
    @objc func CreateView() {
           
           let storyboard = UIStoryboard(name: "Main", bundle: nil)
           let vc = storyboard.instantiateViewController(identifier: "createview") as CreateViewController
           
           vc.onSelect = { [weak self] width, height, x, y, color in
               guard let self = self else { return }
               
               let figure = UIView(frame: CGRect(x: x, y: y, width: width, height: height))
               figure.backgroundColor = color
               self.view.addSubview(figure)
               
               let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.didTap))
               figure.addGestureRecognizer(tapGestureRecognizer)
               
               let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(self.didPan(recognizer:)))
               figure.addGestureRecognizer(panGestureRecognizer)
               
               let pinchGestureRecognizer = UIPinchGestureRecognizer(target: self, action: #selector(self.didPinch))
               figure.addGestureRecognizer(pinchGestureRecognizer)
           }
           navigationController?.pushViewController(vc, animated: true)
       }
       
    
  
        
    @objc func didTap() {
     let storyboard = UIStoryboard(name: "Main", bundle: nil)
                 guard
          let selectVC = storyboard.instantiateViewController(identifier: "createview") as? CreateViewController
                 else { return }
     navigationController?.pushViewController(selectVC, animated: true)
    
       }
    @objc func didPinch(_ sender: UIPinchGestureRecognizer) {
        if let figure = sender.view {
            if sender.state == .began || sender.state == .changed {
                figure.transform = (figure.transform.scaledBy(x: sender.scale, y: sender.scale))
               sender.scale = 1.0
            }
        }
    }
    
    
    var baseOrigin: CGPoint!
      @objc func didPan(recognizer: UIPanGestureRecognizer) {
          if let figure = recognizer.view {
              switch recognizer.state {
              case .began:
                  baseOrigin = figure.frame.origin
              case .changed:
                  let d = recognizer.translation(in: figure)
                  figure.frame.origin.x = baseOrigin.x + d.x
                  figure.frame.origin.y = baseOrigin.y + d.y
              default: break
              }
          }
      }

}
