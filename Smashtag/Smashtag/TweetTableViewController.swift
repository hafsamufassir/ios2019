//
//  TweetTableViewController.swift
//  Smashtag
//
//  Created by Hafsa Mufassir on 10/16/19.
//  Copyright © 2019 Hafsa Mufasssir. All rights reserved.
//

import UIKit

class TweetTableViewController: UITableViewController
{
    var  tweets = [Array<Tweet>](){
        didSet  {
            tableView.reloadData()
        }
    }
    var  searchText: String?  {
        didSet {
            tweets.removeAll()
            searchForTweets()
            title = searchText
        }
    }
    
    private func searchForTweets()
    {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchText = "stanford"
        
    }
 

    // MARK: - UITableViewDataSource

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
