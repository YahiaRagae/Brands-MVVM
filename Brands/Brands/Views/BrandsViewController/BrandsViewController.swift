//
//  BrandsViewController.swift
//  Brands
//
//  Created by Yahia on 6/10/17.
//  Copyright © 2017 Yahia. All rights reserved.
//

import Foundation
import UIKit
import MBProgressHUD
class BrandsViewController : UIViewController , UITableViewDataSource,UITableViewDelegate{
    @IBOutlet weak var tableView: UITableView!
    
    let mv:BrandsViewModel = BrandsViewModel();
    var hud:MBProgressHUD!
    var refreshView :UIRefreshControl!
    
    
    // MARK:- ViewController Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
        registerLocalNotificaiton()
        loadData(isShowActivityIndicator: true)
        
    }
    
    deinit {
        unRegisterLocalNotificaiton()
    }
    
    // MARK:- Helper Methods
    func initViews() {
        addRefreshView();
        registerTableSectionHeader()
        registerCell()
    }
    
    func registerTableSectionHeader(){
        let nib = UINib(nibName: "BrandsHeaderView", bundle: nil)
        self.tableView.register(nib, forHeaderFooterViewReuseIdentifier: "BrandsHeaderView")
    }
    func registerCell(){
        let nib = UINib(nibName: "BrandsTableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "BrandsTableViewCell")
    }
    
    func loadData(isShowActivityIndicator: Bool) {
        activityIndeicator(isShow: isShowActivityIndicator)
        mv.loadBrands { (errorMessage) in
            if(errorMessage != nil  ){
                self.view.makeToast(errorMessage, duration: 2.0, position: "CSToastPositionCenter")
            }else{
                self.tableView.reloadData()
            }
            self.loadingDidEnd()
            
        }
        
    } 
    
    
    // MARK:- UITableView DataSource Methods
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return mv.getCellHeight()
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return mv.getSectionsCount()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mv.getBrandsCountforSection(section: section)
    }
    
    public  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let   cell : BrandsTableViewCell  =  self.tableView.dequeueReusableCell(withIdentifier: "BrandsTableViewCell")! as! BrandsTableViewCell ;
     
        cell.mv = mv.viewModelForCellForRowAt(cellForRowAt: indexPath)
        cell.configure()
        return cell
    }
    // MARK:- UITableView Delegate Methods
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return mv.getHeaderHeight();
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?{
        let header:BrandsHeaderView = self.tableView.dequeueReusableHeaderFooterView(withIdentifier: "BrandsHeaderView") as! BrandsHeaderView
        
        header.lblHeaderName.text = mv.getSectionTitle(section: section)
        
        
        return header
    }
}
