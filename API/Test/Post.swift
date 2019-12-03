//
//  Joke.swift
//  Test
//
//  Created by Hafsa Mufassir on 10/19/19.
//  Copyright © 2019 Hafsa Mufasssir. All rights reserved.
//

import Foundation
import Alamofire
import Cache

class Post: Decodable {
    var id: Int = 0
    var title: String = ""
    var body: String = ""

    init(id: Int, title: String, body: String) {
        self.id = id
        self.title = title
        self.body = body
    }
}
