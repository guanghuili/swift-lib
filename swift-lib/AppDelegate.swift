//
//  AppDelegate.swift
//  swift-lib
//
//  Created by ligh on 15/5/30.
//  Copyright (c) 2015年 ligh. All rights reserved.
//

import UIKit
import CoreData
import Watchdog



@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate ,NSFetchedResultsControllerDelegate{

    var window: UIWindow?
//var draw:DrawerController?
   
    func application(application: UIApplication, willFinishLaunchingWithOptions launchOptions: [NSObject : AnyObject]?) -> Bool {
     
        UIApplication.sharedApplication().setStatusBarStyle(.LightContent, animated: false)
        
        
        
        
   
        
    
//
//        let rightSideNavController =  LefVC(nibName:"LefVC", bundle:nil)
//        
//            rightSideNavController.restorationIdentifier = "ExampleRightNavigationControllerRestorationKey"
//        
//        let leftSideNavController =  LefVC(nibName:"LefVC", bundle:nil)
//        
//        
//        rightSideNavController.restorationIdentifier = "ExampleRightNavigationControllerRestorationKey"
//        
//        
//        let navigationController = ViewController()
//        navigationController.restorationIdentifier = "ExampleLeftNavigationControllerRestorationKey"
//
//        
//        
//        self.draw = DrawerController(centerViewController: navigationController, leftDrawerViewController: leftSideNavController,rightDrawerViewController:nil)
//        
//        self.draw?.showsShadows = true
//        
//        self.draw?.restorationIdentifier = "Drawer"
//        self.draw?.maximumRightDrawerWidth = 100.0
//        self.draw?.openDrawerGestureModeMask = .All
//        self.draw?.closeDrawerGestureModeMask = .All
//        
//        self.draw?.drawerVisualStateBlock = { (drawerController, drawerSide, percentVisible) in
//            let block = ExampleDrawerVisualStateManager.sharedManager.drawerVisualStateBlockForDrawerSide(drawerSide)
//            block?(drawerController, drawerSide, percentVisible)
//        }
        
        //必须设置frame
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        let tintColor = UIColor(red: 29 / 255, green: 173 / 255, blue: 234 / 255, alpha: 1.0)
        self.window?.tintColor = tintColor
        
        self.window?.rootViewController = SloppySwiperNavigationController(rootViewController: ViewController.viewController());
        
       // Travel.fetchedResultsController(sortDescriptorMap: ["a":false], delegate: self)
        
        return true
    }
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        self.window?.backgroundColor = UIColor.whiteColor()
        self.window?.makeKeyAndVisible()
        
        return true
    }
    
    
//    func application(application: UIApplication, viewControllerWithRestorationIdentifierPath identifierComponents: [AnyObject], coder: NSCoder) -> UIViewController? {
//        if let key = identifierComponents.last as? String {
//            if key == "Drawer" {
//                return self.window?.rootViewController
//            } else if key == "ExampleCenterNavigationControllerRestorationKey" {
//                return (self.window?.rootViewController as! DrawerController).centerViewController
//            } else if key == "ExampleRightNavigationControllerRestorationKey" {
//                return (self.window?.rootViewController as! DrawerController).rightDrawerViewController
//            } else if key == "ExampleLeftNavigationControllerRestorationKey" {
//                return (self.window?.rootViewController as! DrawerController).leftDrawerViewController
//            } else if key == "ExampleLeftSideDrawerController" {
//                if let leftVC = (self.window?.rootViewController as? DrawerController)?.leftDrawerViewController {
//                    if leftVC.isKindOfClass(UINavigationController) {
//                        return (leftVC as! UINavigationController).topViewController
//                    } else {
//                        return leftVC
//                    }
//                }
//            } else if key == "ExampleRightSideDrawerController" {
//                if let rightVC = (self.window?.rootViewController as? DrawerController)?.rightDrawerViewController {
//                    if rightVC.isKindOfClass(UINavigationController) {
//                        return (rightVC as! UINavigationController).topViewController
//                    } else {
//                        return rightVC
//                    }
//                }
//            }
//        }
//        
//        return nil
//    }


    func applicationWillResignActive(application: UIApplication) {
        
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

