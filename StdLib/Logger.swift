//
//  Logger.swift
//  MyLifeRPG
//
//  Created by Nicolas Klein on 22/08/2021.
//

import Foundation

/**
 
 This Singleton is used for formatting log events
 */
public class Logger {
    public static let sharedInstance = Logger()
    private init() {
        
    }
    
    public func debug(s: String) {
        print("DEBUG : \(s)")
    }
    
    @available(*, deprecated)
    public func noCommit(s: String) {
        print("NO COMMIT : \(s)")
    }
}
