//
//  Analyzer.swift
//
//  Created by Tiago Almeida de Oliveira on 10/05/21.
//  Copyright © 2021 Tiago Almeida de Oliveira. All rights reserved.
//

import Foundation
import os

final class Analyzer {
    
    static let shared = Analyzer()
    
    private init() { }
    
    func logEvent(message: StaticString) {
        if #available(iOS 14.0, *) {
            os_log(message, log: .eventCycle, type: .info)
        } else {
            debugPrint(message)
        }
    }
    
    func logEvent(format: StaticString, with value: CVarArg) {
        let bundle =  Bundle.main.bundleIdentifier ?? "bundle vazio"
        print("bundle identifier: \(bundle)")
        if #available(iOS 14.0, *) {
            os_log(format, log: OSLog.eventCycle, value)
        } else {
            debugPrint(format)
        }
    }
}

extension OSLog {
    private static var subsystem = Bundle.main.bundleIdentifier ?? Environment.appName
    
    static let eventCycle = OSLog(subsystem: subsystem, category: "EventFlow")
    static let viewCycle = OSLog(subsystem: subsystem, category: "ViewFlow")
}
