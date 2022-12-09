//
//  DDLoggerProvider.swift
//  iLearning
//
//  Created by Amisha Italiya on 09/12/22.
//

import Foundation
import CocoaLumberjack

public func LogD(_ message: @autoclosure () -> String) {
    return DDLogVerbose(message())
}

public func LogE(_ message: @autoclosure () -> String) {
    return DDLogError(message())
}

public func LogW(_ message: @autoclosure () -> String) {
    return DDLogWarn(message())
}

public func LogI(_ message: @autoclosure () -> String) {
    return DDLogInfo(message())
}
