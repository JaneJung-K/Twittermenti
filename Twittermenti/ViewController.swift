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
import SwiftyJSON

class ViewController: UIViewController {
    
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var sentimentLabel: UILabel!
    
    let setimentClassifier = TweetSentimentClassifier()
    
    let swifter = Swifter(consumerKey: "Au0iDkOssPkzgabDVV5vaLYso", consumerSecret: "MJGIXzOPtOOD9T9XpgNXwkMDzQRBQ1sGXC4SRjLX97bn71nMhx")

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let prediction = try! setimentClassifier.prediction(text: "@Apple is the best company!")
//
//        print(prediction.label)
        
        swifter.searchTweet(using: "#blessed", lang: "en", count: 100, tweetMode: .extended, success: { (results, metadata) in
            
            var tweets = [TweetSentimentClassifierInput]()
            
            for i in 0..<100 {
                if let tweet = results[i]["full_text"].string {
                    let tweetForClassification = TweetSentimentClassifierInput(text: tweet)
                    tweets.append(tweetForClassification)
                }
            }
            
            do {
                let predictions = try self.setimentClassifier.predictions(inputs: tweets)
                
                var sentimentScore = 0
                
                for pred in predictions {
                    let sentiment = pred.label
                    
                    if sentiment == "Pos" {
                        sentimentScore += 1
                    } else if sentiment == "neg" {
                        sentimentScore -= 1
                    }
                }
                
                print(sentimentScore)
                
            } catch {
                print("There was an error with making a predition, \(error)")
            }
            
            
            
            
            
            
            
        }) {(error) in
            print("There was an error with the Twitter API Request, \(error)")
        }

        
    }

    @IBAction func predictPressed(_ sender: Any) {
    
    
    }
    
}

