//
//  MyLifeRPGApp.swift
//  MyLifeRPG
//
//  Created by Nicolas Klein on 20/08/2021.
//

import SwiftUI
import UIKit
import Firebase


class AppDelegate: UIResponder, UIApplicationDelegate {
    var isDebug = (ProcessInfo.processInfo.environment["debug"] == "true")
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions:
                        [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        
        return true
    }
    
 
}

public let logger = Logger.sharedInstance

public let i18n = I18n()

@main
struct MyLifeRPGApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    init() {
        print("app started")
        logger.debug(s: "Debug mode is set to : \(appDelegate.isDebug)")
//        let b = Build()
//        b.createReadAndWriteFile()
//        let test = File()
//
//        test.test()
    }
    var body: some Scene {
        WindowGroup {
            let viewModel = AppViewModel()
            ContentView().environmentObject(viewModel)
            
        }
    }
}

