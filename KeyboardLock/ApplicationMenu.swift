//
//  ApplicationMenu.swift
//  KeyboardLock
//
//  Created by Sean on 5/4/2025.
//

import Foundation
import SwiftUI
import AppKit

class ApplicationMenu: NSObject {
    let menu = NSMenu()
    let model = CountdownModel()

    func createMenu() -> NSMenu {
        let contentView = ContentView(countDownTimer: model)
        let topView = NSHostingController(rootView: contentView)

        topView.view.translatesAutoresizingMaskIntoConstraints = false
        let fittingSize = topView.view.fittingSize
        topView.view.setFrameSize(fittingSize)

        let customMenuItem = NSMenuItem()
        customMenuItem.view = topView.view
        menu.addItem(customMenuItem)
        menu.addItem(NSMenuItem.separator())

        return menu
    }
}
