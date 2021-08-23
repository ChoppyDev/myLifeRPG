//
//  Build.swift
//  MyLifeRPG
//
//  Created by Nicolas Klein on 23/08/2021.
//

import Foundation


public class Build {
    public func createReadAndWriteFile() {
        let fm = FileManager.default
        print(fm.currentDirectoryPath)
        
        let current = URL(string : fm.currentDirectoryPath)
        
        let srcroot = URL(string: ProcessInfo.processInfo.environment["SRCROOT"] ?? "/")
        
        print("src root égal \(srcroot?.relativePath)")
        
        let fileURL = URL(fileURLWithPath: "file", relativeTo:  srcroot).path
        
        let fileToo = srcroot?.appendingPathComponent("file").path ?? "/"
        
        print("file twro \(fileToo)")
        
        
        if fm.fileExists(atPath: fileToo) {
            let filePath = URL(string: fileToo)
            let salut = "salut"
            do {
                try salut.write(to: filePath!, atomically: false, encoding: String.Encoding.utf8)
            } catch {
                print("ERROR")
            }
            
            print("existe")
        } else {
            print("existe pas")
        }
        //print(fileURL)
    
        
    }
    
}
