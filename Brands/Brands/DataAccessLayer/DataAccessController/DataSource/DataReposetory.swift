//
//  DataSource.swift
//  Brands
//
//  Created by Yahia on 6/10/17.
//  Copyright © 2017 Yahia. All rights reserved.
//

import Foundation

enum DataSources {
    case Online
    case Local
}

class DataReposetory :NSObject  {

    //Variables
    private var dataSourceType: DataSources?
    private var dataSource: DataAccessControllerInterface?

    private var onlineController:OnlineController!
    private var localController:LocalController!

    override init() {
        super.init();
        onlineController = OnlineController()
        localController = LocalController()
        
        setNewDataSource(source: .Online)
    }
    func getDataSource()->DataAccessControllerInterface{
        return self.dataSource!;
    }
    
    func dataSourceForType(source: DataSources) -> DataAccessControllerInterface?{
        switch source {
        case DataSources.Online:
            return onlineController
        case DataSources.Local:
            return localController
        }
    }
    
    func setNewDataSource(source: DataSources) {
        self.dataSourceType = source
        self.dataSource = dataSourceForType(source: source)
    }
}
