//
//  SecondViewController.swift
//  Test
//
//  Created by Hafsa Mufassir on 10/19/19.
//  Copyright © 2019 Hafsa Mufasssir. All rights reserved.
//

import UIKit
import Alamofire

class SecondViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var titleLabel: UILabel!
    
    // MARK: - Variables
    var post: Post?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        downloadPost(id: post!.id)
    }
    
    // MARK: - Methods
    func downloadPost(id: Int) {
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts/" + String(id) + "/")!
        
        var request = try! URLRequest(url: url, method: .get)
        
        request.setValue("application/json", forHTTPHeaderField: "accept")
        
        Alamofire.request(request).responseData(completionHandler: { response in
            switch response.result {
            case .failure(let error):
                print(error)
            case .success(let data):
                let decoder = JSONDecoder()
                let post = try! decoder.decode(Post.self, from: data)
                self.post = post
                self.titleLabel.text = self.post?.body
            }
        })
    }
}
