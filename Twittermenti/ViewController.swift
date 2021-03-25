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
        
        swifter.searchTweet(using: "@Apple") { (results, metadata) in
            print(results)
        } failure: { (error) in
            print("There was an error with the Twitter API Request, \(error)")
        }

        
    }

    @IBAction func predictPressed(_ sender: Any) {
    
    
    }
    
}

