//
//  DynamicTypeSampleApp.swift
//  DynamicTypeSample
//
//  Created by Yusuke Hasegawa on 2023/12/07.
//

import SwiftUI

class AppDelegate: NSObject, UIApplicationDelegate, ObservableObject {
    
    @Published var dynamicTypeSize: DynamicTypeSize = .xSmall
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        debugPrint("dynamic type : \(application.preferredContentSizeCategory.rawValue)")

        NotificationCenter.default.addObserver(self, selector: #selector(contentSizeUpdate), name: UIContentSizeCategory.didChangeNotification, object: nil)
        
        contentSizeUpdate()
        
        return true
    }
    
    @objc func contentSizeUpdate() {
        debugPrint("contentSizeUpdate")
        
        dynamicTypeSize = .init(UIApplication.shared.preferredContentSizeCategory) ?? .xSmall
        
    }
    
}

@main
struct DynamicTypeSampleApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(appDelegate)
        }
    }
    
}
