//
//  KeyboardLockApp.swift
//  KeyboardLock
//
//  Created by Sean on 5/4/2025.
//

import SwiftUI
import Combine

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
    var cancellable: AnyCancellable?

    lazy var statusBarItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
    let menu = ApplicationMenu()

    func applicationDidFinishLaunching(_ notification: Notification) {
        AppDelegate.instance = self

        let testImage = NSImage(systemSymbolName: "keyboard", accessibilityDescription: nil)
        statusBarItem.button?.image = testImage
        statusBarItem.button?.imagePosition = .imageTrailing

        statusBarItem.menu = menu.createMenu()

        cancellable = menu.model.$timeRemaining
            .receive(on: RunLoop.main)
            .sink { [weak self] newValue in
                // Format timeRemaining to HH:MM:SS
                let hours = Int(newValue) / 3600
                let minutes = (Int(newValue) % 3600) / 60
                let seconds = Int(newValue) % 60
                self?.statusBarItem.button?.title = String(format: "%02d:%02d:%02d", hours, minutes, seconds)
            }
    }

    func applicationWillTerminate(_ notification: Notification) {
        cancellable?.cancel() // Stop observing when app terminates
    }
}
