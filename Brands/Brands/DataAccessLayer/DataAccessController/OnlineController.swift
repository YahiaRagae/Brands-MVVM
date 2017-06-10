//
//  OnlineController.swift
//  Brands
//
//  Created by Yahia on 6/10/17.
//  Copyright © 2017 Yahia. All rights reserved.
//

import Foundation
class OnlineController:NSObject,DataAccessControllerInterface {
    func getBrands(  completion: (([Brand], String?) -> Void)?) {
        BrandsDataFetcher().getBrands(completion: completion)
    }
}
