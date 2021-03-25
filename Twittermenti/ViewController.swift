//
//  ViewController.swift
//  Twittermenti
//
//  Created by Angela Yu on 17/07/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit
import SwifteriOS

class ViewController: UIViewController {
    
    let swifter = Swifter(consumerKey: "Au0iDkOssPkzgabDVV5vaLYso", consumerSecret: "MJGIXzOPtOOD9T9XpgNXwkMDzQRBQ1sGXC4SRjLX97bn71nMhx")
    
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var sentimentLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        swifter.searchTweet(using: "@Apple", lang: "en", count: 100, tweetMode: .extended, success: { (results, metadata) in
            print(results)
        }) {(error) in
            print("There was an error with the Twitter API Request, \(error)")
        }

//        swifter.searchTweet(using: <#T##String#>, geocode: <#T##String?#>, lang: <#T##String?#>, locale: <#T##String?#>, resultType: <#T##String?#>, count: <#T##Int?#>, until: <#T##String?#>, sinceID: <#T##String?#>, maxID: <#T##String?#>, includeEntities: <#T##Bool?#>, callback: <#T##String?#>, tweetMode: <#T##TweetMode#>, success: <#T##Swifter.SearchResultHandler?##Swifter.SearchResultHandler?##(JSON, JSON) -> Void#>, failure: <#T##Swifter.FailureHandler##Swifter.FailureHandler##(Error) -> Void#>)
        
    }

    @IBAction func predictPressed(_ sender: Any) {
    
    
    }
    
}

