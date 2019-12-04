//
//  GameViewController.swift
//  ColorSwicthGame
//
//  Created by Hafsa Mufassir on 12/5/19.
//  Copyright © 2019 Hafsa Mufasssir. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {
    
    override func loadView() {
      self.view = SKView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            let scene = MenuScene(size: view.bounds.size)
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill

                // Present the scene
                view.presentScene(scene)


            view.ignoresSiblingOrder = true

            view.showsFPS = true
            view.showsNodeCount = true
        }

    }
}
