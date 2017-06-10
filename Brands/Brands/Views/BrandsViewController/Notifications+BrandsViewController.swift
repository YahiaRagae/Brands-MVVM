//
//  Notifications+BrandsViewController.swift
//  Brands
//
//  Created by Yahia on 6/10/17.
//  Copyright © 2017 Yahia. All rights reserved.
//

import Foundation
extension BrandsViewController{
    static let NOTIFICATION_ID_DATA_SOURCE_UPDATED = NSNotification.Name(rawValue: "NOTIFICATION_ID_DATA_SOURCE_UPDATED")
    
    func registerLocalNotificaiton(){
        //register observers
        NotificationCenter.default.addObserver(self, selector: #selector(brandStatusChanged), name:  BrandsViewController.NOTIFICATION_ID_DATA_SOURCE_UPDATED  , object: nil)
        
        
        
    }
    func unRegisterLocalNotificaiton(){
        //remove  observers
        NotificationCenter.default.removeObserver(self, name: BrandsViewController.NOTIFICATION_ID_DATA_SOURCE_UPDATED, object: nil)
        
    }
    
    func brandStatusChanged(notification:NSNotification){
        let indexPaths = notification.object  as! [[IndexPath]]
        
        let indexPathsDeleted:[IndexPath] = indexPaths[0]
        let indexPathsUpdated:[IndexPath] = indexPaths[1]
        let indexPathsAdded:[IndexPath] = indexPaths[2]
        
        self.tableView.beginUpdates()
        
            self.tableView.reloadRows(at: indexPathsUpdated, with: .automatic)
        
        
            self.tableView.deleteRows(at: indexPathsDeleted, with: .automatic)
        
        
            
            self.tableView.insertRows(at: indexPathsAdded, with: .automatic)
        
        self.tableView.endUpdates()
    }
}
