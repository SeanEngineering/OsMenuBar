//
//  KeyboardLockApp.swift
//  KeyboardLock
//
//  Created by Sean on 5/4/2025.
//

import SwiftUI

@main
struct KeyboardLockApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        Settings {
            EmptyView()
        }
    }
}

class AppDelegate: NSObject, NSApplicationDelegate {
    static private(set) var instance: AppDelegate!
    var timer: Timer?
    lazy var statusBarItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
    let menu = ApplicationMenu()
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        AppDelegate.instance = self
    
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self,
                                     selector:#selector(updateTime), userInfo: nil, repeats: true)
        RunLoop.main.add(timer!, forMode: .common) // Forcing update on timer
        let testImage = NSImage(systemSymbolName: "keyboard", accessibilityDescription: nil)
        statusBarItem.button?.image = testImage;
        statusBarItem.button?.imagePosition = .imageLeading
        statusBarItem.menu = menu.createMenu()
    }
    
    @objc func updateTime(){
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss"
        let timeString = formatter.string(from: Date())
        
        statusBarItem.button?.title = timeString
    }
    
    func applicationWillTerminate(_ notification: Notification) {
        timer?.invalidate()
    }
}
