//
//  Request.swift
//  GitClone
//
//  Created by user1 on 13/05/22.
//

import UIKit
import Alamofire
import SwiftyJSON

typealias MyResponse = (JSON?) -> Void

class Req {
    static var shared = Req()
    
    let base_url: String = "https://api.unsplash.com"
    
    
    
    func getUserRequest(baseUrl : URL, method : HTTPMethod, compleation: @escaping ((JSON?) -> ()) ) {
           
        self.indicator(show: true)
           AF.request(baseUrl, method: method).response { response in
               self.indicator(show: false)
               
               if let data = response.data {
                   let json = JSON(data)
                   compleation(json)
               } else {
                   compleation(nil)
               }
           }
       }

    
    
    private func indicator(show: Bool) {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.tag = 9998
        if let app = UIApplication.shared.delegate as? AppDelegate, let window = app.window {
            if show {
                window.addSubview(indicator)
                indicator.center = window.center
                indicator.startAnimating()
            } else {
                if let indi = window.viewWithTag(9998) {
                    indi.removeFromSuperview()
                }
            }
        }
    }
}

