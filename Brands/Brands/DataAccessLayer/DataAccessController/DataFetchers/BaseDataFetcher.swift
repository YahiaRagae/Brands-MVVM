//
//  BaseDataFetcher.swift
//  Brands
//
//  Created by Yahia on 6/10/17.
//  Copyright © 2017 Yahia. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
open class  BaseDataFetcher: NSObject{
    static let SETTINGS_MAIN_URL:String = "MainURL"
    static let SETTINGS_URLs:String = "URLs"
    static let SETTINGS_API_KEY:String = "API_KEY"
    
    var sessionManager:SessionManager!
    
    open func getRequestWithJsonReponse( withLink link:String ,    andCompletion  completion:  (( _ response : DataResponse<Any>, _ status : Bool )->Void)? ){
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        
        var headers : [String : String] = [String : String]()
        headers = ["Cache-Control":"max-age=0, no-cache, no-store, must-revalidate",
                   "Pragma" : "no-cache",
                   "Expires": "0"]
        
        if(sessionManager == nil ){
            sessionManager = SessionManager.default
        }
        
        sessionManager.request(link, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: headers)
            .validate()
            .responseJSON { (response) in
                
                switch response.result {
                case .success:
                    completion?(response , true)
                case .failure:
                    completion?(response , false)
                    
                }
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
                
        }
    }
    
    
    
    open  func getSettingdDictionary() ->NSDictionary!
    {
        if let path = Bundle.main.path(forResource: "Settings", ofType: "plist") {
            return NSDictionary(contentsOfFile: path)
        }
        return nil
    }
    
    func getAPIKey()->String{
        
        let settingsDic:NSDictionary = getSettingdDictionary();
        
        let apiKey:String =  "?apiKey=" + (settingsDic.object(forKey: BaseDataFetcher.SETTINGS_API_KEY) as! String) 
        
        return apiKey;

    }
    open func getLink(_ endPointName:String) ->String{
        var link = "";
        
        let settingsDic:NSDictionary = getSettingdDictionary();
        
        let urls:NSDictionary = settingsDic.object(forKey: BaseDataFetcher.SETTINGS_URLs) as! NSDictionary
        
        link = (settingsDic.object(forKey: BaseDataFetcher.SETTINGS_MAIN_URL) as! String) +  (urls.object(forKey: endPointName) as! String)
        
        return link;
    }
    open func getMainLink() ->String{
        var link = "";
        let settingsDic:NSDictionary = getSettingdDictionary();
        link = (settingsDic.object(forKey: BaseDataFetcher.SETTINGS_MAIN_URL) as! String)
        
        return link;
    }
    
}
