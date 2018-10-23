//
//  GesturizerViewController.swift
//  Clock
//
//  Created by jyd on 2018/10/22.
//  Copyright © 2018年 jyd. All rights reserved.
//

import UIKit

class GesturizerViewController: UIViewController {
    @IBOutlet weak var gestureName: UILabel!
    @IBOutlet var singleTap: UITapGestureRecognizer!
    @IBOutlet var doubleTap: UITapGestureRecognizer!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        singleTap.require(toFail: doubleTap)
    }
    

    override var canBecomeFirstResponder: Bool {
        return true
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            showGestureName("Shake")
        }
    }
    
    
    func showGestureName(_ name: String) {
        gestureName.text = name
        UIView.animate(withDuration: 1.0, animations: {self.gestureName.alpha = 1.0}) { _  in
            UIView.animate(withDuration: 1.0, animations: {
                self.gestureName.alpha = 0
            })
        }
    }

    @IBAction func singleTap(_ sender: UITapGestureRecognizer) {
        showGestureName("Single Tap")
    }
    @IBAction func doubleTap(_ sender: UITapGestureRecognizer) {
        showGestureName("Double Tap")
    }
    
    
    @IBAction func pinch(_ sender: UIPinchGestureRecognizer) {
        if sender.state == .ended {
             showGestureName("Pinch")
        }
       
    }
    
    @IBAction func rotation(_ sender: UIRotationGestureRecognizer) {
        if sender.state == .ended {
            showGestureName("Rotation")
        }
    }
    
    
    @IBAction func swipe(_ sender: UISwipeGestureRecognizer) {
        if sender.direction == .right {
            showGestureName("Right Swipe")
        }
    }
    
    @IBAction func leftSwipe(_ sender: UISwipeGestureRecognizer) {
        if sender.direction == .left {
            showGestureName("Left Swipe")
        }
        
    }
    
}
