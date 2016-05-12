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
    
    func getDataFromServer(url: String,param:[String:AnyObject],successed:([String:AnyObject])->(), failed:([String:AnyObject]) -> ()){
        
        /// 系统信息
        var systemStr = String()
        
        /// baseURL
        let baseUrl = "http://back176.7lodge.com/"
        
        /// 需要被访问的URL
        let urlStr = baseUrl + url
        
        /// 设备标示
        let uuid = UIDevice.currentDevice().identifierForVendor!
        
        /// 参数字符串
        var paramStr = String()
        
        if (try? NSJSONSerialization.dataWithJSONObject(param, options: NSJSONWritingOptions(rawValue: 0))) != nil {
            let data = try? NSJSONSerialization.dataWithJSONObject(param, options: NSJSONWritingOptions(rawValue: 0))
            paramStr = String(NSString.init(data: data!, encoding: NSUTF8StringEncoding)!)
        }
      
        /// 拼接系统相关参数json字符串
        let device:[String:AnyObject] = ["deviceType":"ios","version":"1.7.6","deviceId":String(uuid),"model":"ios"]
        
        if ((try? NSJSONSerialization.dataWithJSONObject(device, options: NSJSONWritingOptions(rawValue: 0))) != nil) {
            let data2 = try? NSJSONSerialization.dataWithJSONObject(device, options: NSJSONWritingOptions(rawValue: 0))
            systemStr = String(NSString.init(data: data2!, encoding: NSUTF8StringEncoding)!)
        }
        
        /// 拼接请求参数信息
        let params:[String:AnyObject] = ["param":paramStr,"systemParam":systemStr]
        
        /// 请求网络
        let request = NetworkTool.shareManager().request(.POST, urlStr, parameters: params, encoding: ParameterEncoding.URL, headers: nil)
        
        /// 服务器返回数据
        request.validate().responseJSON { response in
            print("Response Json : \(response.result.value)")
            
            let result = response.result.value as! [String:AnyObject]
            
            
            let status = result["status"]
            
            let statusCode = status!["status_code"]!
            
            print(statusCode)
            
            if statusCode!.description == "0"{
                successed(result)
            }else{
                failed(result)
            }
        }
        
    }
}
