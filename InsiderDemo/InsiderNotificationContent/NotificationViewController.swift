//
//  NotificationViewController.swift
//  InsiderNotificationContent
//
//  Created by Mahammad on 18.11.2021.
//  Copyright © 2021 Insider. All rights reserved.
//

import UIKit
import UserNotifications
import UserNotificationsUI

//class NotificationViewController: UIViewController, UNNotificationContentExtension, iCarouselDelegate, iCarouselDataSource {
//
//    @IBOutlet weak var carousel: iCarousel!
//    deinit {
//        carousel.delegate = nil
//        carousel.dataSource = nil
//    }
//
//    func numberOfItems(in carousel: iCarousel) -> Int {
//        return InsiderPushNotification.getNumberOfSlide()
//    }
//
//    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
//        return InsiderPushNotification.getSlide(index, reusing: view, superView: self.view)
//    }
//
//    func carouselItemWidth(_ carousel: iCarousel) -> CGFloat {
//        return InsiderPushNotification.getItemWidth()
//    }
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any required interface initialization here.
//
//        InsiderPushNotification.interactivePushLoad(APP_GROUP, superView:self.view)
//        carousel.type = .rotary
//        carousel.reloadData()
//    }
//
//    func didReceive(_ notification: UNNotification) {
//        InsiderPushNotification.interactivePushDidReceive()
//    }
//
//
//    func didReceive(
//        _ response: UNNotificationResponse,
//        completionHandler completion: @escaping (UNNotificationContentExtensionResponseOption) -> Void) {
//        if (response.actionIdentifier == "insider_int_push_next") {
//            carousel.scrollToItem(at: InsiderPushNotification.didReceiveResponse(carousel.currentItemIndex), animated: true)
//            completion(.doNotDismiss)
//        } else {
//            InsiderPushNotification.logPlaceholderClick(response)
//            completion(.dismissAndForwardAction)
//        }
//    }
//
//}
