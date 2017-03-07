# NetworkManager

> Alamofire swift NetworkManager 

## use
```
 let url : String = "aaa/1.html"
 
 let parameters: [String: String] = [
 "userId":"",
 "password":""]
 
 NetworkManager.get(url, parameters: parameters as [String : AnyObject], success: {(result: NSDictionary) -> Void in
 print ("Api Success : result is:\n \(result)")
 }, failure: {(error: NSDictionary?) -> Void in
 print ("Api Failure : error is:\n \(error)")
 })
 ```
