//
//  CardManager.swift
//  again
//
//  Created by Catie Cook on 11/1/16.
//  Copyright © 2016 ThunderWhatever. All rights reserved.
//

import Foundation
import Alamofire

func loadCards(callback: @escaping (Data) -> Void){
    
    let searchURL = "https://jsonagainsthumanity.herokuapp.com/"
    
    Alamofire.request(searchURL).responseJSON(completionHandler : {
        response in
        print("Got Cards")
        callback(response.data!)
    })

}
