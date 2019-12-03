//
//  Joke.swift
//  Test
//
//  Created by erumaru on 9/25/19.
//  Copyright © 2019 KBTU. All rights reserved.
//

import Foundation
import Alamofire
import Cache

class Joke {
    // MARK: - Variables
    var value = ""
    static var categories: [String] {
        get {
            do {
                return try cache.object(forKey: "categories")
            } catch {
                return []
            }
        }
        set {
            do {
                try cache.setObject(newValue, forKey: "categories")
            } catch {}
        }
    }
    
    static let cache = try! Cache.Storage(diskConfig: DiskConfig(name: "file"), memoryConfig: MemoryConfig(expiry: .never), transformer: TransformerFactory.forCodable(ofType: [String].self))
    
    // MARK: - Init
    init(value: String) {
        self.value = value
    }
    
    // MARK: - Methods
    static func downloadCategories(completion: @escaping ([String]) -> Void)  {
        let url = URL(string: "https://matchilling-chuck-norris-jokes-v1.p.rapidapi.com/jokes/categories")!
        
        var request = try! URLRequest(url: url, method: .get)
        
        
        request.setValue("matchilling-chuck-norris-jokes-v1.p.rapidapi.com", forHTTPHeaderField: "X-RapidAPI-Host")
        request.setValue("045a44f780msh7408af3128502f7p14705bjsnadba9166b682", forHTTPHeaderField: "X-RapidAPI-Key")
        request.setValue("application/json", forHTTPHeaderField: "accept")
        
        Alamofire.request(request).responseJSON(completionHandler: { response in
            switch response.result {
            case .failure(let error):
                print(error)
            case .success(let json):
                let categories = json as! [String]
                
                self.categories = categories
                
                completion(categories)
            }
        })
    }
    
    static func downloadJoke(for category: String, completion: @escaping (Joke) -> Void) {
        let url = URL(string: "https://matchilling-chuck-norris-jokes-v1.p.rapidapi.com/jokes/random")!
        
        let parameters: Parameters = [
            "category" : category
        ]
        
        let headers: HTTPHeaders = [
            "X-RapidAPI-Host" : "matchilling-chuck-norris-jokes-v1.p.rapidapi.com",
            "X-RapidAPI-Key" : "045a44f780msh7408af3128502f7p14705bjsnadba9166b682",
            "accept" : "application/json"
        ]
        
        Alamofire.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: headers).responseJSON(completionHandler: { response in
            switch response.result {
            case .failure(let error):
                print(error)
            case .success(let json):
                let value = (json as! [String : Any])["value"] as! String
                let joke = Joke(value: value)
                
                completion(joke)
            }
        })
    }
}
