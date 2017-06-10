//
//  DataAccessController.swift
//  Brands
//
//  Created by Yahia on 6/10/17.
//  Copyright © 2017 Yahia. All rights reserved.
//

import Foundation 
import AlamofireImage
//MARK: Protocol
protocol DataAccessControllerInterface{
    func getBrands(  completion: (([Brand], String?) -> Void)?) ;
}

class DataAccessController : DataAccessControllerInterface {
    
    //Singleton Access
    static let sharedInstance = DataAccessController()
    
    //Image Cache
    let imageCache = AutoPurgingImageCache()

    //Vars
    private var dataReposetory:DataReposetory!
    
    
    //Init and Init Helpers
    private init() {
        dataReposetory = DataReposetory()
    }
    
    func setNewDataSource(source: DataSources) {
        dataReposetory.setNewDataSource(source: source)
    }
    
    // MARK:- Getting Data
    func getBrands(  completion: (([Brand], String?) -> Void)?) {
        dataReposetory.getDataSource().getBrands(  completion: completion)
    }
    
    
}
