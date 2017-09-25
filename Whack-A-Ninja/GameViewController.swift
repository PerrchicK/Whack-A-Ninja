//
//  GameViewController.swift
//  Whack-A-Ninja
//
//  Created by noa levy on 21/08/2017.
//  Copyright © 2017 Roy Levy. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load 'GameScene.sks' as a GKScene. This provides gameplay related content
        // including entities and graphs.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        reload()
    }
    
    func reload() {
        if let view = self.view as? SKView {
            // Load the SKScene from 'GameScene.sks'
            if let scene = GameScene(fileNamed: "GameScene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                scene.gameViewController = self
                scene.name = "\(Date.init().timeIntervalSince1970)" // Just to uniquely identify the scene
                // Present the scene
                view.presentScene(scene) // (1) This creates a strong reference to the NEW 'GameScene' object and REPLACES the old one (try to run "po view.scene" in lldb). (2) When the object 'view' will die, the scene will die with it.
            }
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let theDestination = (segue.destination as! EndGameViewController)
        theDestination.score = sender as! Int
    }

    func endGame(score: Int){
        performSegue(withIdentifier: "End Game", sender: score)
    }

    deinit {
        // For debugging purposes
        print("\(self) is dead")
    }
}
