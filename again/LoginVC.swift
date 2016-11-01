//
//  ViewController.swift
//  again
//
//  Created by Ji Kim on 10/31/16.
//  Copyright © 2016 ThunderWhatever. All rights reserved.
//

import UIKit
import Alamofire

class LoginVC: UIViewController {

    var blackCards = [String]()
    var whiteCards = [String]()
    
    var searchURL = "https://jsonagainsthumanity.herokuapp.com/"
    typealias JSONStandard = [String: AnyObject]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black
        loadCards()
    }
    
    
    func callCards(url: String) {
        Alamofire.request(url).responseJSON(completionHandler : {
            response in
            self.parseData(JSONData: response.data!)
        })
    }
    
    func parseData(JSONData : Data) {
        do {
            var readableJSON = try JSONSerialization.jsonObject(with: JSONData, options: .mutableContainers) as! JSONStandard
            print(readableJSON["blackCards"])
        }
        catch {
            print(error)
        }
    }
    

}

