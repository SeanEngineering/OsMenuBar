//
//  ApplicationMenu.swift
//  KeyboardLock
//
//  Created by Sean on 5/4/2025.
//

import Foundation
import SwiftUI

class ApplicationMenu: NSObject {
    @State var countDownTimer: Float = 0.0
    let menu = NSMenu()
    
    func createMenu() -> NSMenu {
        let contentView = ContentView(countDownTimer: $countDownTimer);
        let topView = NSHostingController(rootView: contentView)
        topView.view.frame.size = CGSize(width: 300, height: 500)
        
        let customMenuItem = NSMenuItem()
        customMenuItem.view = topView.view
        menu.addItem(customMenuItem)
        menu.addItem(NSMenuItem.separator())
        return menu
    }
}
