//
//  LoadData+BrandsViewModel.swift
//  Brands
//
//  Created by Yahia on 6/10/17.
//  Copyright © 2017 Yahia. All rights reserved.
//


import Foundation
import UIKit
extension BrandsViewModel {
    func loadBrands(completion: (( String?) -> Void)?){
        DataAccessController.sharedInstance.getBrands { (_items, errorMessage) in
            if(errorMessage != nil && _items.count == 0 ){
                completion!(errorMessage)
                return;
            }
            self.selectedItems = [Brand]()
            self.items = _items
            
            completion!(nil)
        }
        
    }
}
