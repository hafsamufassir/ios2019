//
//  AuthManager.swift
//  ColorSwitch
//
//  Created by Hafsa Mufassir on 12/4/19.
//  Copyright © 2019 Hafsa Mufasssir. All rights reserved.
//

import Foundation
import FirebaseAuth
import SpriteKit

class AuthManager {
    // MARK: - Variables
    private var verificationID: String?
    static var shared = AuthManager()
    let  provider = PhoneAuthProvider.provider()
    
    // MARK: - Methods
    func sendSMS(phone: String, uiDelegate: AuthUIDelegate, completion: @escaping () -> Void) {
        provider.verifyPhoneNumber(phone, uiDelegate: uiDelegate) { (verificationID, error) in
            if let error = error {
                print(error)
                return
            }
          
            self.verificationID = verificationID
            completion()
        }
    }
    
    func checkSMS(code: String, completion: @escaping (String?) -> Void) {
        guard let id = verificationID else {
            completion("error")
            return
        }
        
        let credential = PhoneAuthProvider.provider().credential(withVerificationID: id, verificationCode: code)
        
        Auth.auth().signIn(with: credential) { (authResult, error) in
            if let error = error {
                completion(error.localizedDescription)
                return
            }
          
            completion(nil)
        }
    }
}

