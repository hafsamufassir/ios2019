//
//  VerifyCodeViewController.swift
//  ColorSwitch
//
//  Created by Hafsa Mufassir on 12/4/19.
//  Copyright © 2019 Hafsa Mufasssir. All rights reserved.
//

import UIKit
import SpriteKit

class VerifyCodeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            let scene = VerifyCodeScene(size: view.bounds.size)
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill

                // Present the scene
                view.presentScene(scene)


            view.ignoresSiblingOrder = true

            view.showsFPS = true
            view.showsNodeCount = true
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
