//
//  Helpers+BrandsViewController.swift
//  Brands
//
//  Created by Yahia on 6/10/17.
//  Copyright © 2017 Yahia. All rights reserved.
//

import Foundation
import UIKit
import MBProgressHUD
extension BrandsViewController {
    //Add Pull To Refresh
    func addRefreshView(){
        if(refreshView != nil ){
            return
        }
        refreshView = UIRefreshControl()
        
        if #available(iOS 10.0, *) {
            tableView.refreshControl = refreshView
        } else {
            tableView.addSubview(refreshView)
        }
        refreshView.addTarget(self, action: #selector(loadData), for:.valueChanged)
        
    }
    /// Show / Hide Activity Indeicator
    /// - parameter isShow: True to show The Activity Inndicator and False to hide it
    func activityIndeicator(isShow:Bool){
        if(isShow){
            hud = MBProgressHUD.showAdded(to:  self.tableView, animated: true)
            hud.label.text = "loading"
            hud.mode = .indeterminate
        }else{
            MBProgressHUD.hide(for: self.tableView, animated: true)
        }
    }
    
    /// Call it when Data is Available
    func loadingDidEnd(){
        if(self.refreshView != nil && self.refreshView.isRefreshing){
            self.refreshView.endRefreshing()
        }
        
        if(hud != nil && !hud.isHidden){
            activityIndeicator(isShow: false)
        }
    }
}
