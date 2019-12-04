//
//  VerifyCodeScene.swift
//  ColorSwitch
//
//  Created by Hafsa Mufassir on 12/4/19.
//  Copyright © 2019 Hafsa Mufasssir. All rights reserved.
//

import SpriteKit

class VerifyCodeScene: SKScene {
    
    var codeTextField:UITextField!
    var loginBtn:SKShapeNode!
    
    private struct Constants {
        static let phoneTextFieldPlaceholder = "Type  code"
        static let sendSMSText = "Send"
    }
    
    override func didMove(to view: SKView) {
        print("Verify Code Scene opend")
        backgroundColor =  UIColor(red: 44/255,  green: 62/255, blue: 80/255,  alpha: 1.0)
        addLogo()
        addCodeTextField()
        addCheckButton()
    }
    
    func addLogo() {
        let logo = SKSpriteNode(imageNamed: "logo")
        logo.size = CGSize(width: frame.size.width/4, height: frame.size.width/4)
        logo.position = CGPoint(x: frame.midX, y: frame.midY + frame.size.height/4)
        addChild(logo)
        
    }
    
    func addCodeTextField(){
        guard let view = self.view else { return }
        let originX = (view.frame.size.width - view.frame.size.width/1.5)/2
        codeTextField = UITextField(frame: CGRect.init(x: originX, y: view.frame.size.height/2.8, width: view.frame.size.width/1.5, height: 30))
            customize(textField: codeTextField, placeholder: Constants.phoneTextFieldPlaceholder)
        view.addSubview(codeTextField)
    }
    
    func customize(textField:UITextField, placeholder:String , isSecureTextEntry:Bool = false) {
        _ = UIView(frame:CGRect(x:0, y: 0, width: 10, height: 30))
        textField.layer.cornerRadius = 8
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 1))
        textField.leftViewMode = .always
        textField.backgroundColor = .yellow
        textField.setContentHuggingPriority(.defaultLow, for: .vertical)
        textField.textContentType = .telephoneNumber
        textField.keyboardType = .phonePad
        textField.returnKeyType = .done
    }
    
    func addCheckButton(){
        let checkBtn = SKColor(red: 252/255, green: 186/255, blue: 3/255, alpha: 1)
        loginBtn = getButton(frame: CGRect(x: self.size.width/2.8, y: self.size.height/2, width: self.size.width/4, height: 30), fillColor: checkBtn,title: Constants.sendSMSText, logo: nil,name: "sendBtn")
        addChild(loginBtn)
        loginBtn.zPosition = 1
    }
    
    func getButton(frame:CGRect, fillColor: SKColor,title: String = "", logo:SKSpriteNode!, name:String)->SKShapeNode {
        let btn = SKShapeNode(rect: frame, cornerRadius: 10)
        btn.fillColor = fillColor
        btn.strokeColor = fillColor
        if let l = logo {
            btn.addChild(l)
            l.zPosition = 2
            l.position = CGPoint(x:frame.origin.x+(frame.size.width/2),y:frame.origin.y+(frame.size.height/2))
            l.name = name
        }
        if !title.isEmpty {
            let label = SKLabelNode.init(fontNamed: "AvenirNext-Bold")
            label.text = title; label.fontSize = 15
            label.fontColor = .black
            btn.addChild(label)
            label.zPosition = 3
            label.position = CGPoint(x:frame.origin.x+(frame.size.width/2),y:frame.origin.y+(frame.size.height/4))
            label.name = name
        }
        btn.name = name
        return btn
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
           let gameScene = GameScene(size: view!.bounds.size)
           view?.presentScene(gameScene)
        codeTextField.isHidden = true
           
           checkSMS()
       }
    
    @objc private func checkSMS() {
        guard let code = codeTextField.text else { return }
        
        AuthManager.shared.checkSMS(code: code) { [weak self] message in
            guard self != nil else { return }
            if let message = message {
                print(message)
                return
            }
            
//            let vc = GameViewController()
//            UIApplication.shared.keyWindow?.rootViewController = vc
        }
    }

}
