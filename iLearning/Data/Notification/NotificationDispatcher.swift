//
//  NotificationDispatcher.swift
//  iLearning
//
//  Created by Amisha Italiya on 06/12/22.
//

import Foundation

public enum AppNotification {
    case userDidLogin
    case userDidLogOut
    case languageChanged
}

@objc
public protocol NotificationObserver: AnyObject {
    func notificationReceived(_ notification: Notification)
}

extension NotificationObserver {
    public func registerForNotifs() {
        NotificationDispatcher.sharedInstance.registerObserver(self)
    }

    public func unregisterFromNotifs() {
        NotificationDispatcher.sharedInstance.unregisterObserver(self)
    }
}

public class NotificationDispatcher {

    public static let sharedInstance = NotificationDispatcher()

    fileprivate static let appNotificationName = Notification.Name("appNotificationName")
    fileprivate static let appNotificationUserInfoKey = "appNotification"

    fileprivate init() {
        // singleton
    }

    public func dispatch(_ notification: AppNotification) {
        let userInfo: [String: Any] = [NotificationDispatcher.appNotificationUserInfoKey: NotificationHolder(notification: notification)]
        NotificationCenter.default.post(name: NotificationDispatcher.appNotificationName, object: nil, userInfo: userInfo)
    }

    public func registerObserver(_ observer: NotificationObserver) {
        unregisterObserver(observer)
        NotificationCenter.default.addObserver(observer, selector: #selector(NotificationObserver.notificationReceived(_:)),
                                               name: NotificationDispatcher.appNotificationName, object: nil)
    }

    public func unregisterObserver(_ observer: NotificationObserver) {
        NotificationCenter.default.removeObserver(observer, name: NotificationDispatcher.appNotificationName, object: nil)
    }
}

public extension Notification {

    public var appNotification: AppNotification? {
        if let userInfo = self.userInfo, let notificationHolder = userInfo[NotificationDispatcher.appNotificationUserInfoKey] as? NotificationHolder {
            return notificationHolder.notification
        }
        return nil
    }
}

private class NotificationHolder {
    let notification: AppNotification

    init(notification: AppNotification) {
        self.notification = notification
    }
}
