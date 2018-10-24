//
//  GameViewController.swift
//  SwiftTestDemo
//
//  Created by jyd on 2018/10/24.
//  Copyright © 2018年 jyd. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let scene = GKScene(fileNamed: "GameScene") {
            if let sceneNode = scene.rootNode as! GameScene? {
                sceneNode.entities = scene.entities
                sceneNode.graphs = scene.graphs
                
                sceneNode.scaleMode = .aspectFill
                
                if let view = self.view as! SKView? {
                    view.presentScene(sceneNode)
                    view.ignoresSiblingOrder = true
                    view.showsFPS = true
                    view.showsNodeCount = true
                }
            }
        }
    }
    

    override var shouldAutorotate: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

}
