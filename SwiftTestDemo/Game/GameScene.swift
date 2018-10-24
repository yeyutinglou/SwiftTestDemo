//
//  GameScene.swift
//  SwiftTestDemo
//
//  Created by jyd on 2018/10/24.
//  Copyright © 2018年 jyd. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameScene: SKScene {
    var entities = [GKEntity]()
    var graphs = [String : GKGraph]()
    private var lastUpdateTime: TimeInterval = 0
    private var labelNode: SKLabelNode?
    private var shapeNode: SKShapeNode?
    
    override func sceneDidLoad() {
        self.lastUpdateTime = 0
        self.labelNode = self.childNode(withName: "//helloLabel") as? SKLabelNode
        if let labelNode = self.labelNode {
            labelNode.alpha = 0
            labelNode.run(SKAction.fadeIn(withDuration: 2.0))
        }
        
        let w = (self.size.width + self.size.height) * 0.05
        self.shapeNode = SKShapeNode.init(rectOf: CGSize(width: w, height: w), cornerRadius: w * 0.3)
        
        if let shapeNode = self.shapeNode {
            shapeNode.lineWidth = 2.5
            shapeNode.run(SKAction.repeatForever(SKAction.rotate(byAngle: CGFloat(Double.pi), duration: 1)))
            shapeNode.run(SKAction.sequence([SKAction.wait(forDuration: 0.5), SKAction.fadeOut(withDuration: 0.5), SKAction.removeFromParent()]))
        }
    }
    
    func touchDown(atPoint point: CGPoint) {
        if let node = self.shapeNode?.copy() as! SKShapeNode? {
            node.position = point
            node.strokeColor = SKColor.green
            self.addChild(node)
        }
    }
    
    func touchMoved(toPoint point: CGPoint) {
        if let node = self.shapeNode?.copy() as! SKShapeNode? {
            node.position = point
            node.strokeColor = SKColor.blue
            self.addChild(node)
        }
    }
    
    func touchUp(atPoint point: CGPoint) {
        if let node = self.shapeNode?.copy() as! SKShapeNode? {
            node.position = point
            node.strokeColor = SKColor.red
            self.addChild(node)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let shapeNode = self.shapeNode {
            shapeNode.run(SKAction.init(named: "Pulse")!, withKey: "fadeInOut")
        }
        for t in touches {
            self.touchDown(atPoint: t.location(in: self))
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {
            self.touchMoved(toPoint: t.location(in: self))
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {
            self.touchUp(atPoint: t.location(in: self))
        }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {
            self.touchUp(atPoint: t.location(in: self))
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        if self.lastUpdateTime == 0 {
            self.lastUpdateTime = currentTime
        }
        
        let dt = currentTime - self.lastUpdateTime
        
        for entity in self.entities {
            entity.update(deltaTime: dt)
        }
        self.lastUpdateTime = currentTime
        
    }

}
