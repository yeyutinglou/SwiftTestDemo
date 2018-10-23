//
//  NoiseMaker.swift
//  Clock
//
//  Created by jyd on 2018/10/19.
//  Copyright © 2018年 jyd. All rights reserved.
//

import AVFoundation
import UIKit

class NoiseMaker: NSObject {

    let audioFileNames = ["guitar", "applause", "monster", "bubbles"]
    let players:[AVAudioPlayer?]
    override init() {
        players = audioFileNames.map{ fileName in
            if let url = Bundle.main.url(forResource: fileName, withExtension: "wav") {
                return try? AVAudioPlayer(contentsOf: url)
            } else {
                return nil
            }
        }
    }
    
    func play(_ index: Int) {
        if !players.isEmpty && index >= 0 && index < players.count {
            players[index]?.play()
        }
    }
    
}
