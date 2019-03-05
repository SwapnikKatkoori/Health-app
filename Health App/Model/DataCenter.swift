//
//  DataCenter.swift
//  Health App
//
//  Created by Swapnik R. Katkoori on 3/4/19.
//  Copyright © 2019 Swapnik R. Katkoori. All rights reserved.
//

import UIKit
import Alamofire

class DataCenter{
    let url:String
    
    init(food:String) {
        url = "https://api.nal.usda.gov/ndb/search/?format=json&q=\(food)&sort=n&max=25&offset=0&api_key=DEMO_KEY"
    }
    func getFoodInfo(){
        Alamofire.request(self.url).responseJSON { response in
        
            if let json = response.result.value {
                print("JSON: \(json)") // serialized json response
            }
        
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                print("Data: \(utf8Text)") // original server data as UTF8 string
            }
        }
    }
}
