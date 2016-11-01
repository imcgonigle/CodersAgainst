//
//  getData.swift
//  again
//
//  Created by Catie Cook on 11/1/16.
//  Copyright © 2016 ThunderWhatever. All rights reserved.
//

import UIKit
import Alamofire

class getData: NSObject {

    var blackCards = [String]()
    var whiteCards = [String]()
    
    var searchURL = "https://jsonagainsthumanity.herokuapp.com/"
    typealias JSONStandard = [String: AnyObject]
    
    func callCards(url: String) {
        Alamofire.request(url).responseJSON(completionHandler : {
            response in
            self.parseData(JSONData: response.data!)
        })
    }
    
    func parseData(JSONData : Data) {
        do {
            _ = try JSONSerialization.jsonObject(with: JSONData, options: .mutableContainers) as! JSONStandard
        }
        catch {
            print(error)
        }
    }
}



//    let url = URL(string: "https://jsonagainsthumanity.herokuapp.com/")
//    let task = URLSession.shared.dataTask(with: self.url!) { data, response, error in
//        guard error == nil else {
//            print(error)
//            return
//        }
//        guard let data = data else {
//            print("Data is empty")
//
//            return
//        }
//
//        let json = try! JSONSerialization.jsonObject(with: data, options: [])
//        print(json)
//    }
//    task.resume()
//
//    PlaygroundPage.current.needsIndefiniteExecution = true
//

