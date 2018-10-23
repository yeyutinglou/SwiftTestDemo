//
//  ViewController.swift
//  SwiftTestDemo
//
//  Created by jyd on 2018/10/23.
//  Copyright © 2018年 jyd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    var timer: Timer?
    
    
    @IBOutlet weak var elapseTimeLabel: UILabel!
    let stopWatch = StopWatch()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimeLabel), userInfo: nil, repeats: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateTimeLabel()
    }
    
    @objc func updateTimeLabel() {
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        timeLabel.text = formatter.string(from: Date())
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.all
    }
    
    deinit {
        if let timer = self.timer {
            timer.invalidate()
        }
    }
    
    
    @IBAction func startButtonClick(_ sender: UIButton) {
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateElapsedTimeLabel(_:)), userInfo: nil, repeats: true)
        stopWatch.start()
    }
    
    @IBAction func stopButtonClick(_ sender: UIButton) {
        stopWatch.stop()
    }
    
    
    @objc func updateElapsedTimeLabel(_ timer: Timer) {
        if stopWatch.isRunning {
            elapseTimeLabel.text = stopWatch.elapsedTimeAsString
        } else {
            timer.invalidate()
        }
    }
    


}

