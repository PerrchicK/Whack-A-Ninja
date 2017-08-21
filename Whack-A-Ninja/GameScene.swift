//
//  GameScene.swift
//  Whack-A-Ninja
//
//  Created by noa levy on 21/08/2017.
//  Copyright © 2017 Roy Levy. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    var tiles = [Tile]()
    var gameTime : SKLabelNode!
    var gameScore : SKLabelNode!
    var gameViewController: GameViewController?
    var popupTime = 0.85;
    private var score : Int = 0{
        didSet {
            gameScore.text = "Score: \(score)"
        }
    }
    private var time = 0{
        didSet {
            gameTime.text = "Time: \(time)"
        }
    }

    override func didMove(to view: SKView) {
        
        
        let background = SKSpriteNode(imageNamed: "wood_bg")
        background.position = CGPoint(x : 0 , y: 0)
        background.blendMode = .replace
        addChild(background)
        
        gameScore = SKLabelNode(fontNamed: "ChalkDuster")
        gameScore.text = "Score: 0"
        gameScore.fontSize = 48
        gameScore.zPosition = 1
//        gameScore.horizontalAlignmentMode = .left
//        gameScore.verticalAlignmentMode = .bottom
        gameScore.position = CGPoint(x: -150, y: -450)
        addChild(gameScore)
        
        gameTime = SKLabelNode(fontNamed: "ChalkDuster")
        gameTime.text = "Time: 30"
        gameTime.fontSize = 48
        gameTime.zPosition = 1
        gameTime.position = CGPoint(x: 150, y: -450)

        addChild(gameTime)
        
        for i in 0..<5 {
            createSlotAt(pos: CGPoint(x:-260 + (i * 140), y:410))
        }
        for i in 0..<4 {
            createSlotAt(pos: CGPoint(x:-190 + (i * 140), y:210))
        }
        for i in 0..<5 {
            createSlotAt(pos: CGPoint(x:-260 + (i * 140), y:50))
        }
        for i in 0..<4 {
            createSlotAt(pos: CGPoint(x:-190 + (i * 140), y:-100))
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [unowned self] in
            self.createBadNinja()
        }
        
    }
    
    func createSlotAt(pos: CGPoint){
        let tile = Tile()
        tile.configureAtPosition(pos: pos)
        addChild(tile)
        tiles.append(tile)
    }
    
    func createBadNinja(){
        time+=1
        
        if(time >= 30){
            for tile in tiles {
                tile.hide()
            }
            
            let gameOver = SKSpriteNode(imageNamed: "gameOver")
            gameOver.position = CGPoint(x: 0, y: 0)
            addChild(gameOver)
            
            self.run(SKAction.wait(forDuration: 1.0))
            self.gameViewController?.endGame(score: score)
            return

        }
        
        //        decrease popup time so the ninjas will pop up faster throughout the game
        popupTime *= 0.991;
        
        tiles = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: tiles) as! [Tile]
        tiles[0].show(hideTime: popupTime)
        
//        randomize a number of ninjas shown at every single time
//        always how atleast one and max is 5
        if RandomInt(min:0, max:12 ) > 4 { tiles[1].show(hideTime: popupTime) }
        if RandomInt(min:0, max:12 ) > 8 { tiles[2].show(hideTime: popupTime) }
        if RandomInt(min:0, max:12 ) > 10 { tiles[3].show(hideTime: popupTime) }
        if RandomInt(min:0, max:12 ) > 11 { tiles[4].show(hideTime: popupTime) }
        
        let minDelay = popupTime / 2.0
        let maxDelay = popupTime * 2.0
        let delay = RandomDouble(min: minDelay, max: maxDelay)
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) { [unowned self] in
            self.createBadNinja()
        }
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
   
    }
    
    func touchMoved(toPoint pos : CGPoint) {
    
    }
    
    func touchUp(atPoint pos : CGPoint) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: self)
            let tappedNodes = nodes(at: location)
            
            for node in tappedNodes {
                if node.name == "charGood" {
                    // they shouldn't have whacked this penguin
                    let tile = node.parent!.parent as! Tile
                    if !tile.visible { continue }
                    if tile.isHit { continue }
                    
                    tile.hit()
                    score -= 5
                    
                    run(SKAction.playSoundFileNamed("whackBad.caf", waitForCompletion:false))
                } else if node.name == "charBad" {
                    // they should have whacked this one
                    let tile = node.parent!.parent as! Tile
                    if !tile.visible { continue }
                    if tile.isHit { continue }
                    
                    tile.charNode.xScale = 0.85
                    tile.charNode.yScale = 0.85
                    
                    tile.hit()
                    score += 1
                    
                    run(SKAction.playSoundFileNamed("whack.caf", waitForCompletion:false))
                }
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
     
    }
}
