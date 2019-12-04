//
//  AuthScene.swift
//  ColorSwitch
//
//  Created by Hafsa Mufassir on 12/4/19.
//  Copyright © 2019 Hafsa Mufasssir. All rights reserved.
//

import SpriteKit
import UIKit
import FirebaseAuth

class AuthScene: SKScene, AuthUIDelegate {
    func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        
    }
    
    func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
        
    }
    
   
    
    var phoneTextField: UITextField!
    var sendBtn: SKShapeNode!
//    weak var  delegate: AuthUIDelegate?
    
    private struct Constants {
        static let phoneTextFieldPlaceholder = "Type your number"
        static let sendSMSText = "Send"
    }
    
    override func didMove(to view: SKView) {
        backgroundColor =  UIColor(red: 44/255,  green: 62/255, blue: 80/255,  alpha: 1.0)
        addLogo()
        addPhoneTextField()
        addSendButton()
    }
    
    func addLogo() {
        let logo = SKSpriteNode(imageNamed: "logo")
        logo.size = CGSize(width: frame.size.width/4, height: frame.size.width/4)
        logo.position = CGPoint(x: frame.midX, y: frame.midY + frame.size.height/4)
        addChild(logo)
    }
    
    func addPhoneTextField(){
        guard let view = self.view else { return }
        let originX = (view.frame.size.width - view.frame.size.width/1.5)/2
        phoneTextField = UITextField(frame: CGRect.init(x: originX, y: view.frame.size.height/2.8, width: view.frame.size.width/1.5, height: 30))
            customize(textField: phoneTextField, placeholder: Constants.phoneTextFieldPlaceholder)
        view.addSubview(phoneTextField)
    }
    
    func customize(textField:UITextField, placeholder:String , isSecureTextEntry:Bool = false) {
        _ = UIView(frame:CGRect(x:0, y: 0, width: 10, height: 30))
        textField.layer.cornerRadius = 8
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 1))
        textField.leftViewMode = .always
        textField.backgroundColor = .white
//        textField.setContentHuggingPriority(.defaultLow, for: .vertical)
        textField.textContentType = .oneTimeCode
        textField.keyboardType = .phonePad
//        textField.returnKeyType = .done
    }

    
    func addSendButton(){
        let sendBtnColor = SKColor(red: 252/255, green: 186/255, blue: 3/255, alpha: 1)
        sendBtn = getButton(frame: CGRect(x: self.size.width/2.8, y: self.size.height/2, width: self.size.width/4, height: 30), fillColor: sendBtnColor,title: Constants.sendSMSText, logo: nil,name: "sendBtn")
        addChild(sendBtn)
        sendBtn.zPosition = 1

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
        let verifyCodeScene = VerifyCodeScene(size: view!.bounds.size)
        view?.presentScene(verifyCodeScene)
        phoneTextField.isHidden = true
        
//        let verifyCodeScene = VerifyCodeScene(fileNamed: "VerifyCodeScene")
//        verifyCodeScene?.scaleMode = .aspectFill
//        self.view?.presentScene(verifyCodeScene)
        
        sendSMS()
    }
    
    @objc private func sendSMS() {
        guard let phone = phoneTextField.text else { return }

        AuthManager.shared.sendSMS(phone: phone, uiDelegate: self) { [weak self] in
            guard self != nil else { return }
            
        }
        
    }
    
//    deinit {
//        print("\n THE SCENE \((type(of: self))) WAS REMOVED FROM MEMORY (DEINIT) \n")
//    }

}
