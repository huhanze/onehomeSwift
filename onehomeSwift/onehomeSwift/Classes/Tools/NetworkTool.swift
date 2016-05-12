//
//  NetworkTool.swift
//  OneHome
//
//  Created by 北京一游网络有限公司 on 16/5/11.
//  Copyright © 2016年 yiyou. All rights reserved.
//

import UIKit
import Alamofire

class NetworkTool: Manager {

    static let instance: NetworkTool = {
        let tool = NetworkTool()
        return tool
    }()
    
    class func shareManager() -> NetworkTool{
        return instance
    }
    
    func getDataFromServer(url: String,param:[String:AnyObject],successed:([String:AnyObject])->()){
        let baseUrl = "http://back176.7lodge.com/"
        let urlStr = baseUrl + url
        let uuid = UIDevice.currentDevice().identifierForVendor!
        let data = try? NSJSONSerialization.dataWithJSONObject(param, options: NSJSONWritingOptions(rawValue: 0))
        let jsonStr = NSString.init(data: data!, encoding: NSUTF8StringEncoding)
      
        let device:[String:AnyObject] = ["deviceType":"ios","version":"1.7.6","deviceId":String(uuid),"model":"ios"]
        
        let data2 = try? NSJSONSerialization.dataWithJSONObject(device, options: NSJSONWritingOptions(rawValue: 0))
        let systemStr = NSString.init(data: data2!, encoding: NSUTF8StringEncoding)
        
        let params:[String:AnyObject] = ["param":"\(jsonStr!)","systemParam":"\(systemStr!)"]
        
        let request = NetworkTool.shareManager().request(.POST, urlStr, parameters: params, encoding: ParameterEncoding.URL, headers: nil)
            
        request.validate().responseJSON { response in
            print("Response Json : \(response.result.value)")
            
            let result = response.result.value as! [String:AnyObject]
            successed(result)
        }
        


    }
}
