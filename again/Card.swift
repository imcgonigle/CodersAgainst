//
//  Card.swift
//  again
//
//  Created by Catie Cook on 11/1/16.
//  Copyright © 2016 ThunderWhatever. All rights reserved.
//

import Foundation

let blackCardPlaceholder = "____________"


struct Card {
    let content: String
    let type: String
    
    init(content: String, type: String) {
        self.content = content
        self.type = type
    }
}

struct CardArray {
    let array: Array<Card>
    
    init(array: Array<Card>) {
        self.array = array
    }
}
