//
//  AppDelegate.swift
//  Twitter
//
//  Created by Ryan Liszewski on 2/19/17.
//  Copyright © 2017 Smiley. All rights reserved.
//

import UIKit
import BDBOAuth1Manager

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //window = UIWindow(frame: UIScreen.main.bounds)
        
//        let storyBoard = UIStoryboard(name: "main", bundle: nil)
//        
//        let homeTimeLineNavigationController = storyBoard.instantiateViewController(withIdentifier: "") as! UINavigationController
//        
//        let profileTimeLineNavigationController = storyBoard.instantiateViewController(withIdentifier: "") as! UINavigationController

         UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName : UIColor.white]
        
        if User.currentUser != nil {
            print("There is a current user")
            
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            let viewController = storyBoard.instantiateViewController(withIdentifier: "TweetsNavigationController")
            window?.rootViewController = viewController
            
        }
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: User.userDidLogoutNotification), object: nil, queue: OperationQueue.main) { (Notification) in
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            let viewController = storyBoard.instantiateInitialViewController()
            
            self.window?.rootViewController = viewController
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
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        
        TwitterClient.sharedInstance?.handleOpenUrl(url: url)
        return true
    }


}

