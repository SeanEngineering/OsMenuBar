//
//  File.swift
//  KeyboardLock
//
//  Created by Sean on 9/4/2025.
//

import Foundation

class CountdownModel: ObservableObject {
    @Published var timeRemaining: Float = 0.0

    private var timer: Timer?

    func startTimer() {
        stopTimer()
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            if self.timeRemaining > 0 {
                self.timeRemaining -= 1
            } else {
                self.stopTimer()
            }
        }
        RunLoop.main.add(timer!, forMode: .common)
    }

    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
}
