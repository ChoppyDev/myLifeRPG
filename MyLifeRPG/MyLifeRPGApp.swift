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

  var window: UIWindow?

  func application(_ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions:
    [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct MyLifeRPGApp: App {

    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            let viewModel = AppViewModel()
            ContentView().environmentObject(viewModel)
        }
    }

}
