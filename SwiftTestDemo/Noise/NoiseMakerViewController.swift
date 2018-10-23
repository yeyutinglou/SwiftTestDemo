//
//  NoiseMakerViewController.swift
//  Clock
//
//  Created by jyd on 2018/10/19.
//  Copyright © 2018年 jyd. All rights reserved.
//

import UIKit

class NoiseMakerViewController: UIViewController {


    let noiseMaker = NoiseMaker()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    @IBAction func playNoise(_ sender: UIButton) {
        noiseMaker.play(sender.tag)
    }
    
}
