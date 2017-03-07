//
//  AlamofireManager.swift
//  SharePhoto
//
//  Created by roycms on 2017/3/7.
//  Copyright © 2017年 北京三芳科技有限公司. All rights reserved.
//
/** NetworkManager demo
 let url : String = "aaa/1.html"
 
 let parameters: [String: String] = [
 "userId":"",
 "password":""]
 
 NetworkManager.get(url, parameters: parameters as [String : AnyObject], success: {(result: NSDictionary) -> Void in
 print ("Api Success : result is:\n \(result)")
 }, failure: {(error: NSDictionary?) -> Void in
 print ("Api Failure : error is:\n \(error)")
 })
**/

import UIKit
import Alamofire

let baseUrl : String = "http://server.19860911.cn/"

class NetworkManager: NSObject {
    typealias apiSuccess = (_ result: NSDictionary) -> Void
    typealias apiFailure = (_ error: NSDictionary?) -> Void
    
    class func get(_ strURL: String, parameters: [String: AnyObject], success:@escaping apiSuccess, failure:@escaping apiFailure) {
        Alamofire.request(baseUrl + strURL, parameters: parameters).responseJSON { (responseObject) -> Void in
            print("\nmakeGetCall:\n\(responseObject)")
            
            if responseObject.result.isSuccess {
                let JSON = responseObject.result.value as? NSDictionary
                if (JSON != nil) {
                    success(JSON!)
                }
                else {
                    failure(["error":"API Format Error", "statusCode":999])
                }
            }
            if responseObject.result.isFailure {
                let httpError: NSError = responseObject.result.error! as NSError
                let statusCode = httpError.code
                let error:NSDictionary = ["error" : httpError,"statusCode" : statusCode]
                failure(error)
            }
        }
    }
    
    class func post(_ strURL: String, parameters: [String: AnyObject], success:@escaping apiSuccess, failure:@escaping apiFailure) {
        Alamofire.request(baseUrl + strURL, method: .post, parameters: parameters).responseJSON { (responseObject) -> Void in
            print("\nmakePostCall:\n\(responseObject)")
            
            if responseObject.result.isSuccess {
                let JSON = responseObject.result.value as? NSDictionary
                if (JSON != nil) {
                    success(JSON!)
                }
                else {
                    failure(["error":"API Format Error", "statusCode":999])
                }
            }
            if responseObject.result.isFailure {
                let httpError: NSError = responseObject.result.error! as NSError
                let statusCode = httpError.code
                let error:NSDictionary = ["error" : httpError,"statusCode" : statusCode]
                failure(error)
            }
        }
    }
}
