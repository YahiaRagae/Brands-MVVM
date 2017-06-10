//
//  BrandsTableViewCell.swift
//  Brands
//
//  Created by Yahia on 6/10/17.
//  Copyright © 2017 Yahia. All rights reserved.
//

import Foundation
import UIKit
import BEMCheckBox
class BrandsTableViewCell:UITableViewCell,BEMCheckBoxDelegate{
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var checkBox: BEMCheckBox!
    
    var mv:BrandsCellViewModel!
    
    func configure()
    {
        if(mv == nil){
            return
        }
        
        lblName.text = mv.getBrandName()
        checkBox.setOn(mv.isSelected(), animated: true)
        img.imageFromUrl(urlString: mv.getBrandLogoLink())
        
        
        checkBox.delegate = self
        checkBox.isAccessibilityElement = true
        checkBox.accessibilityIdentifier = "MyCheckBox"
        
        lblName.isAccessibilityElement = true
        lblName.accessibilityIdentifier = "MyLabel"
        
    }
    
    func didTap(_ checkBox: BEMCheckBox) { 

        let indexPath:NSIndexPath = (self.superview?.superview as! UITableView).indexPath(for: self)! as NSIndexPath
        NotificationCenter.default.post(name: BrandsViewModel.NOTIFICATION_ID_BRAND_STATUS_CHANGED , object: indexPath)
        
    }
}
