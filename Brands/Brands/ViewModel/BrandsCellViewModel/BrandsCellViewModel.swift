//
//  BrandsCellViewModel.swift
//  Brands
//
//  Created by Yahia on 6/10/17.
//  Copyright © 2017 Yahia. All rights reserved.
//

import Foundation
class BrandsCellViewModel:NSObject{
    var brand:Brand! 
    
    init( brand _brand:Brand ) {
        super.init()
        self.brand = _brand
    }
    
    func getBrandName()->String{
        return brand.name!
    }
    
    func isSelected()->Bool{
        return brand.isSelected;
    }
    
    func getBrandLogoLink()->String{
        return brand.logo!;
    }
}
