//
//  AppDelegate.swift
//  InsiderDemo
//
//  Created by Insider on 5.08.2020.
//  Copyright © 2020 Insider. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {
    
    var window: UIWindow?
    
    // FIXME: Please change with your app group.
    let APP_GROUP = "group.com.useinsider.InsiderDemo"
    
    // FIXME: Please change with your partner name.
    // Make sure that all the letters are lowercase.
    let INSIDER_PARTNER_NAME = "your_partner_name"
    
    // FIXME: Please change your URL Types to your partner name with insider prefix.
    // URL Type which identifier is Insider and URL Schemes is your Insider Partner Name with insider prefix.
    // For instance, insideryourpartnername where yourpartnername is your partner name.
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        UNUserNotificationCenter.current().delegate = self
        
        Insider.initWithLaunchOptions(launchOptions, partnerName: INSIDER_PARTNER_NAME, appGroup: APP_GROUP)
        Insider.register(withQuietPermission: false)
        Insider.registerCallback(with: #selector(insiderCallbackHandler(info:)), sender: self)
        Insider.enableAppTracker(true)
        Insider.enableIDFACollection(false);
        
        // You need to have required permissions in order to have location information from the user.
        // MARK: Please add required permissons to your info.plist.
        // https://developer.apple.com/documentation/corelocation/requesting_authorization_for_location_services
        Insider.startTrackingGeofence();
        
        Insider.getCurrentUser()?.setLocale()("tr_TR")
        
        return true
    }
    
    @objc func insiderCallbackHandler(info: [String : AnyObject]){
        let type = info["type"]?.intValue ?? -1
        switch type {
        case InsiderCallbackType.notificationOpen.rawValue:
            print(info)
            break
        case InsiderCallbackType.inappButtonClick.rawValue:
            print(info)
            break
        case InsiderCallbackType.tempStorePurchase.rawValue:
            print(info)
            break
        case InsiderCallbackType.tempStoreAddedToCart.rawValue:
            print(info)
            break
        case InsiderCallbackType.tempStoreCustomAction.rawValue:
            print(info)
            break
        default:
            print(info)
            break
        }
    }
    
}

