//
//  CardManager.swift
//  again
//
//  Created by Catie Cook on 11/1/16.
//  Copyright © 2016 ThunderWhatever. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


func loadCards() -> ([Card], [Card]){
    
    var whiteCards = [Card]()
    var blackCards = [Card]()
    
    let searchURL = "https://jsonagainsthumanity.herokuapp.com/"
    
    
    Alamofire.request(searchURL).responseJSON(completionHandler : {
        response in
      (blackCards, whiteCards) = parseData(JSONData: response.data!)
    })
 
    return (blackCards, whiteCards)
}


func parseData(JSONData : Data) -> ([Card], [Card]) {
    do {
        var blackCards = [Card]()
        var whiteCards = [Card]()
        
        let json = JSON(data: JSONData)
       
        for i in 0..<json["blackCards"].count {
            
            var card = json["blackCards"][i]
            let text = card["text"].string

            if card["pick"] == 1 {
                let card = Card(content: text!, type: "Black")
                blackCards.append(card)
            }

        }
        
        for i in 0..<json["whiteCards"].count {
            
            let text = json["whiteCards"][i].string
            let card = Card(content: text!, type: "White")
            whiteCards.append(card)
            
        }
        
        return (blackCards, whiteCards)
        
    }
}
