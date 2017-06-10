//
//  AppDelegate.swift
//  Brands
//
//  Created by Yahia on 6/10/17.
//  Copyright © 2017 Yahia. All rights reserved.
//

import UIKit
import Reachability

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var reach: Reachability?
    
    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        // Allocate a reachability object
        self.reach = Reachability.forInternetConnection()
        
        // Set the blocks
        self.reach!.reachableBlock = {
            (reach: Reachability?) -> Void in
            DispatchQueue.main.async {
                DataAccessController.sharedInstance.setNewDataSource(source: .Online)
            }
        }
        
        self.reach!.unreachableBlock = {
            (reach: Reachability?) -> Void in
            DataAccessController.sharedInstance.setNewDataSource(source: .Local)
        }
        
        self.reach!.startNotifier()
        
        if self.reach!.isReachable() {
            DataAccessController.sharedInstance.setNewDataSource(source: .Online)
        }else{
            DataAccessController.sharedInstance.setNewDataSource(source: .Local)
        }
        
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    
}

