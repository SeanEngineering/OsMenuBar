//
//  LockType.swift
//  KeyboardLock
//
//  Created by Sean on 5/4/2025.
//

import Foundation

enum LockType: String, Codable, CaseIterable {
    case locked = "Locked"
    case unlocked = "Unlocked"
    
    var type: String {
        switch self {
            case .locked:
                return "locked"
        case .unlocked:
            return "unlocked"
        }
    }
    
    
}
