//
//  GameViewController.swift
//  Login
//
//  Created by Hafsa Mufassir on 12/3/19.
//  Copyright © 2019 Hafsa Mufasssir. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController, TransitionDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let view = self.view as! SKView? else { return }
        view.ignoresSiblingOrder = true
        view.showsFPS = true
        view.showsNodeCount = true
        let scene = GameScene(size:view.bounds.size)
        scene.scaleMode = .fill
        scene.delegate = self as TransitionDelegate
        scene.anchorPoint = CGPoint.zero
        view.presentScene(scene)
    }
    func showAlert(title:String,message:String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .default) { action in
            print("handle Ok action...")
        })
        alertController.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil))
        self.present(alertController, animated: true)
    }
    func handleLoginBtn(username:String,password:String) {
        print("handleLoginBtn")
        print("username is: \(username) and password: \(password)")
    }
    func handleFacebookBtn() {
       print("handleFacebookBtn")
    }
    func handleTwitterBtn() {
        print("handleTwitterBtn")
    }
}
