# Insider Swift Sample App <img src="https://github.com/github/explore/raw/main/topics/swift/swift.png" alt="swift" width="35" height="35"/>
For more information about iOS integration please check the [link](https://academy.useinsider.com/docs/ios-integration)

Check the changelogs 👉 [here](https://academy.useinsider.com/docs/ios-sdk-changelog)

## Before getting the build:
1. Change the partner name with yours in the [AppDelegate.m](https://github.com/useinsider/swift-sample/blob/master/InsiderDemo/InsiderDemo/AppDelegate.swift#L21) file.
2. Change the App Groups with yours for [AppDelegate.m](https://github.com/useinsider/swift-sample/blob/master/InsiderDemo/InsiderDemo/AppDelegate.swift#L17), [NotificationService.m](https://github.com/useinsider/swift-sample/blob/master/InsiderDemo/InsiderNotificationService/NotificationService.m#L23) and [NotificationViewController.m](https://github.com/useinsider/swift-sample/blob/master/InsiderDemo/InsiderNotificationContent/NotificationViewController.m#L20) files
3. Choose your team from the Xcode's Signing & Capabilities tab, under the Signing section
4. Repeat the previous step for all targets(InsiderDemo, InsiderNotificationContent, NotificationService)
5. Change bundle identifier with yours and select desired App Group
6. Repeat the previous step for all targets(InsiderDemo, InsiderNotificationContent, NotificationService)
7. Change the partner name for the URL Types, URL Schemes section(InsiderDemo)
8. In the project folder type ```pod install``` for getting dependencies
