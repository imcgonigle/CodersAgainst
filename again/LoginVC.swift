//
//  ViewController.swift
//  again
//
//  Created by Ji Kim on 10/31/16.
//  Copyright © 2016 ThunderWhatever. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class LoginVC: UIViewController {

    var blackCards = [Card]()
    var whiteCards = [Card]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black
        loadCards(callback: addToDeckCallback)
        
    }
    
    
    func addToDeckCallback(JSONData : Data){
        
        let json = JSON(data: JSONData)
        
        for i in 0..<json["blackCards"].count {
            
            var card = json["blackCards"][i]
            let text = card["text"].string
            
            if card["pick"] == 1 {
                let card = Card(content: text!, type: "Black")
                self.blackCards.append(card)
            }
            
        }
        
        for i in 0..<json["whiteCards"].count {
            
            let text = json["whiteCards"][i].string
            let card = Card(content: text!, type: "White")
            self.whiteCards.append(card)
            
        }
        
    }
}


