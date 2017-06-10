//
//  BrandsViewModel.swift
//  Brands
//
//  Created by Yahia on 6/10/17.
//  Copyright © 2017 Yahia. All rights reserved.
//

import Foundation
class BrandsViewModel : NSObject{
    var selectedItems:[Brand] = [Brand]()
    var items:[Brand] = [Brand]()
    
    override init() {
        super.init()
        registerLocalNotificaiton()
    }
    
    deinit {
        unRegisterLocalNotificaiton()
    }
    
    // MARK:- UITableView DataSource Getters
    func getCellHeight()->CGFloat
    {
        return 60
    }
    func getHeaderHeight()->CGFloat
    {
        return 50
    }
    func getSectionsCount()->Int{
        return 2;
    }
    func getBrandsCountforSection(section:Int)->Int{
        switch section {
        case 0:
            return selectedItems.count
        case 1:
            return  items.count;
        default:
            return 0
        }
    }
    func getSectionTitle(section:Int)->String{
        switch section {
        case 0:
            return "Selected Brands"
        case 1:
            return  "All Brands"
        default:
            return ""
        }
    }
    
    func viewModelForCellForRowAt(cellForRowAt indexPath: IndexPath) -> BrandsCellViewModel! {
        var brand:Brand!
        switch indexPath.section {
        case 0:
            brand = selectedItems[indexPath.row]
        case 1:
            brand = items[indexPath.row]
        default:
            return nil
        }
        
        return BrandsCellViewModel(brand: brand )
    }

}
