//
//  Tile.swift
//  Whack-A-Ninja
//
//  Created by noa levy on 21/08/2017.
//  Copyright © 2017 Roy Levy. All rights reserved.
//
import SpriteKit
import UIKit

class Tile: SKNode {
    var charNode: SKSpriteNode!
    
    var visible = false;
    var isHit = false;
    var random: Int = 0
    func configureAtPosition(pos: CGPoint){
        position = pos
        
        let sprite = SKSpriteNode(imageNamed: "whackHole")
        sprite.zPosition = 2;
        addChild(sprite)
        
        let cropNode = SKCropNode()
        cropNode.position = CGPoint(x:0, y:15)
        cropNode.zPosition = 3
        cropNode.maskNode = SKSpriteNode(imageNamed: "WhackMask")
//        need to know if im visible and if i have been hit
        
        charNode = SKSpriteNode(imageNamed: "bad_ninjagif.gif")
        charNode.position = CGPoint(x:0, y:-90)
        charNode.name = "character"
        cropNode.addChild(charNode)
        
        addChild(cropNode)
//        this function set the ninja visible and decide if its good or evil
        
    }
    
    func show(hideTime: Double){
        if visible {return}
        
        charNode.run(SKAction.moveBy(x: 0, y: 80, duration: 0.05))
        visible = true;
        isHit = false;
//        range of random -> (0-2)
         random = Int(arc4random_uniform(3))
        if random == 0 {
            charNode.texture = SKTexture(imageNamed: "ninja_good")
            charNode.name = "charGood"
        } else {
            charNode.texture = SKTexture(imageNamed: "bad_ninjagif.gif")
            charNode.name = "charBad"
        }
        charNode.xScale = 1
        charNode.yScale = 1
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + hideTime * 3.5, execute: { [unowned self] in
            self.hide()
        })
    }
    
    func hide(){
        if !visible {return}
        
        charNode.run(SKAction.moveBy(x: 0, y: -80, duration: 0.05))
        visible = false;

    }
    
    func hit(){
        isHit = true
        
        let delay = SKAction.wait(forDuration: 0.25)
        let hide = SKAction.moveBy(x: 0, y: -80, duration: 0.5)
        let notVisible = SKAction.run({[unowned self] in self.visible = false})
        let sequence = SKAction.sequence([delay,hide,notVisible])
        charNode.run(sequence)
        
    }
}
