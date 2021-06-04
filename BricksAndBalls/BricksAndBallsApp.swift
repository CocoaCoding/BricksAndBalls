//
//  BricksAndBallsApp.swift
//  BricksAndBalls
//
//  Created by Holger Hinzberg on 21.04.21.
//

import SwiftUI

@main
struct BricksAndBallsApp: App {
    
    @UIApplicationDelegateAdaptor(CustomAppDelegate.self) var appDelegate
    
    var body: some Scene {
        
        WindowGroup {
            //ContentView()
            LevelChooseScene()
        }
    }
}

class CustomAppDelegate : NSObject, UIApplicationDelegate {

    public static var shared: CustomAppDelegate!
    public var gameEnviroment = GameEnviroment()
        
    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        UINavigationBar.appearance().tintColor = .white
        
        //Use this if NavigationBarTitle is with Large Font
        UINavigationBar.appearance().backgroundColor = .systemBlue
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        //Use this if NavigationBarTitle is with displayMode = .inline
        UINavigationBar.appearance().barTintColor = .systemBlue
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
        
        UITableViewHeaderFooterView.appearance().tintColor = UIColor.clear
        
        CustomAppDelegate.shared = self
        
        return true
    }
}
