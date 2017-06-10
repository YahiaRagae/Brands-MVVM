//
//  LocalController.swift
//  Brands
//
//  Created by Yahia on 6/10/17.
//  Copyright © 2017 Yahia. All rights reserved.
//

import Foundation
import SwiftyJSON
class LocalController:NSObject,DataAccessControllerInterface{
    func getBrands(  completion: (([Brand], String?) -> Void)?) {
        DispatchQueue.global(qos: .background).async {
            let path = self.getJsonPath()
            let jsonData = NSData(contentsOfFile:path)
            let json = JSON(data: jsonData! as Data)
            let brands : [Brand] = self.parseBrands(json: json)
            DispatchQueue.main.async {
                completion!(brands,nil)
            }
        }
    }
    
    func getJsonPath()->String{
        return Bundle.main.path(forResource: "brands", ofType: "json")!
    }
    // MARK: Parsers
    func parseBrands(json: JSON ) -> [Brand]{
        var items:[Brand] = [Brand]();
        if let itemsArray = json["brands"].array {
            for item in itemsArray {
                let brand:Brand = Brand.init(json: item)
                items.append(brand)
            }
        }
        return items;
    }

}
