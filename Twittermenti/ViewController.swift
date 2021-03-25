//
//  ViewController.swift
//  Twittermenti
//
//  Created by Angela Yu on 17/07/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit
import SwifteriOS
import CoreML

class ViewController: UIViewController {
    
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var sentimentLabel: UILabel!
    
    let setimentClassifier = TweetSentimentClassifier()
    
    let swifter = Swifter(consumerKey: "Au0iDkOssPkzgabDVV5vaLYso", consumerSecret: "MJGIXzOPtOOD9T9XpgNXwkMDzQRBQ1sGXC4SRjLX97bn71nMhx")

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let prediction = try! setimentClassifier.prediction(text: "@Apple is the best company!")
        
        print(prediction.label)
        
        swifter.searchTweet(using: "@Apple", lang: "en", count: 100, tweetMode: .extended, success: { (results, metadata) in
            //print(results)
        }) {(error) in
            print("There was an error with the Twitter API Request, \(error)")
        }

        
    }

    @IBAction func predictPressed(_ sender: Any) {
    
    
    }
    
}

