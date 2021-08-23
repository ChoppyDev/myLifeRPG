//
//  File.swift
//  MyLifeRPG
//
//  Created by Nicolas Klein on 23/08/2021.
//

import Foundation


public class File {
    public func test() {
        let fm = FileManager.default
        let srcroot = ProcessInfo.processInfo.environment["SRCROOT"]
        print(srcroot)
        
        
        if srcroot != nil {
            fm.createFile(atPath: srcroot ?? "0", contents: nil)
        }
    }
   
}
