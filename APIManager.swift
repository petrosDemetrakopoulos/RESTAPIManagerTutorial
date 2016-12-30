//
//  APIManager.swift
//  RESTAPIManager
//
//  Created by Petros Demetrakopoulos on 21/12/2016.
//  Copyright © 2016 Petros Demetrakopoulos. All rights reserved.
//

import UIKit
import SwiftyJSON
class APIManager: NSObject {
    
    let baseURL = "https://jsonplaceholder.typicode.com"
    static let sharedInstance = APIManager()
   static let getPostsEndpoint = "/posts/"
    
    func getPostWithId(postId: Int, onSuccess: @escaping(JSON) -> Void, onFailure: @escaping(Error) -> Void){
    let url : String = baseURL + APIManager.getPostsEndpoint + String(postId)
    let request: NSMutableURLRequest = NSMutableURLRequest(url: NSURL(string: url)! as URL)
    request.httpMethod = "GET"
    let session = URLSession.shared
    let task = session.dataTask(with: request as URLRequest, completionHandler: {data, response, error -> Void in
        if(error != nil){
            onFailure(error!)
        } else{
            let result = JSON(data: data!)
            onSuccess(result)
        }
    })
    task.resume()
}

}
