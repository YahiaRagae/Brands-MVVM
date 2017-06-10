//
//  BrandsDataFetcher.swift
//  Brands
//
//  Created by Yahia on 6/10/17.
//  Copyright © 2017 Yahia. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
class BrandsDataFetcher:BaseDataFetcher,DataAccessControllerInterface{
  let URL_GET_ALL_BRANDS : String = "URL_GET_ALL_BRANDS"

    func getBrands(completion: (([Brand], String?) -> Void)?) {
        let link = "\(getLink(URL_GET_ALL_BRANDS))\(getAPIKey())"

        getRequestWithJsonReponse(withLink: link) { (response, status) in
            var   items:[Brand] = [Brand]()
            if(status){
                items = self.parseBrands(response: response)
            }
            completion?(items,response.result.error?.localizedDescription)
        }

    }
    
    // MARK: Parsers
    func parseBrands(response: DataResponse<Any>) -> [Brand]{
        var items:[Brand] = [Brand]();
        let json = JSON(response.result.value!)
        if let itemsArray = json["brands"].array {
            for item in itemsArray {
                let brand:Brand = Brand.init(json: item)
                items.append(brand)
            }
        }
        return items;
    }
    
}
