//
//  Notifications+BrandsViewModel.swift
//  Brands
//
//  Created by Yahia on 6/10/17.
//  Copyright © 2017 Yahia. All rights reserved.
//

import Foundation
extension BrandsViewModel {
    
    static let NOTIFICATION_ID_BRAND_STATUS_CHANGED = NSNotification.Name(rawValue: "NOTIFICATION_ID_BRAND_STATUS_CHANGED")

    func registerLocalNotificaiton(){
        //register observers
        NotificationCenter.default.addObserver(self, selector: #selector(brandStatusChanged), name:  BrandsViewModel.NOTIFICATION_ID_BRAND_STATUS_CHANGED  , object: nil)
        
        
        
    }
    func unRegisterLocalNotificaiton(){
        //remove  observers
        NotificationCenter.default.removeObserver(self, name: BrandsViewModel.NOTIFICATION_ID_BRAND_STATUS_CHANGED, object: nil)
       
    }
    
    func brandStatusChanged(notification:NSNotification){
        let indexPath:IndexPath = notification.object as! IndexPath
        
        var indexPathsDeleted:[IndexPath]=[IndexPath]()
        var indexPathsUpdated:[IndexPath]=[IndexPath]()
        var indexPathsAdded:[IndexPath]=[IndexPath]()
        
        
        var brand:Brand!
        switch indexPath.section {
        case 0:
            brand = selectedItems[indexPath.row];
        case 1:
            brand = items[indexPath.row];
        default: break
        }
        
        
        if(brand.isSelected){
            brand.isSelected = false
            if let index = items.index(of: brand) {
                items[index] = brand
                indexPathsUpdated.append(IndexPath(item: index, section: 1))
            }
            if let index = selectedItems.index(of: brand) {
                selectedItems.remove(at: index)
                indexPathsDeleted.append(IndexPath(item: index, section: 0))

            }
        }else{
            brand.isSelected = true
            if let index = items.index(of: brand) {
                items[index] = brand
                indexPathsUpdated.append(IndexPath(item: index, section: 1))

            }
            selectedItems.append(brand)
            indexPathsAdded.append(IndexPath(item: selectedItems.count-1, section: 0))

        }
        
        NotificationCenter.default.post(name: BrandsViewController.NOTIFICATION_ID_DATA_SOURCE_UPDATED , object: [indexPathsDeleted,indexPathsUpdated,indexPathsAdded])

        
    }
}
