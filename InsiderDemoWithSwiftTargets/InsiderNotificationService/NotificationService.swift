//
//  NotificationService.swift
//  InsiderNotificationService
//
//  Created by Insider on 17.08.2020.
//  Copyright © 2020 Insider. All rights reserved.
//

import UserNotifications

// FIXME: Please change with your app group.
let APP_GROUP = "group.com.useinsider.InsiderDemo"

class NotificationService: UNNotificationServiceExtension {
    
    var contentHandler: ((UNNotificationContent) -> Void)?
    var bestAttemptContent: UNMutableNotificationContent?
    
    override func didReceive(_ request: UNNotificationRequest, withContentHandler contentHandler: @escaping (UNNotificationContent) -> Void) {
        self.contentHandler = contentHandler
        bestAttemptContent = (request.content.mutableCopy() as? UNMutableNotificationContent)
        
        if let bestAttemptContent = bestAttemptContent {
            // Modify the notification content here...
            
            let nextButtonText = ">>"
            let goToAppText = "Launch App"
            
            InsiderPushNotification.showInsiderRichPush(
                request,
                appGroup: APP_GROUP as String,
                nextButtonText: nextButtonText,
                goToAppText: goToAppText,
                success: { attachment in
                    if let attachment = attachment {
                        bestAttemptContent.attachments = bestAttemptContent.attachments + [attachment as UNNotificationAttachment]
                        print(bestAttemptContent.attachments)
                    }
                    print(bestAttemptContent.attachments)
                    contentHandler(bestAttemptContent)
                    print(bestAttemptContent.attachments)
            })
            print(bestAttemptContent.attachments)
        }
    }
    
    override func serviceExtensionTimeWillExpire() {
        // Called just before the extension will be terminated by the system.
        // Use this as an opportunity to deliver your "best attempt" at modified content, otherwise the original push payload will be used.
        if let contentHandler = contentHandler, let bestAttemptContent =  bestAttemptContent {
            contentHandler(bestAttemptContent)
        }
    }
    
}

