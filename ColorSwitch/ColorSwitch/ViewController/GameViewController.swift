//
//  GameViewController.swift
//  ColorSwitch
//
//  Created by Hafsa Mufassir on 12/2/19.
//  Copyright © 2019 Hafsa Mufasssir. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            let scene = AuthScene(size: view.bounds.size)
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
//            scene.delegate  = self

                // Present the scene
                view.presentScene(scene)


            view.ignoresSiblingOrder = true

            view.showsFPS = true
            view.showsNodeCount = true
        }

    }
}
