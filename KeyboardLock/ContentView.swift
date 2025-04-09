//
//  ContentView.swift
//  KeyboardLock
//
//  Created by Sean on 5/4/2025.
//

import SwiftUI

struct ContentView: View {
//    Create a basic app that can lock the keyboard
//    Also allow the user to view their cpu and memory usage
//    Create a timer view in the menubar also
    @ObservedObject var countDownTimer: CountdownModel
    @State var isKeyboardLocked: Bool = false
    @State var timerStarted: Bool = false
    @State var progressValue: Float = 0.0
    @State var cpuUsage: Float = 0.0
    @State var memoryUsage: Float = 0.0
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .center){
                Toggle("Lock keyboard", isOn: $isKeyboardLocked)
                    .toggleStyle(SwitchToggleStyle(tint: .blue))
            }
            HStack(alignment: .center){
                Button(action: {
                    self.timerStarted.toggle()
                    if timerStarted {
                        countDownTimer.startTimer()
                    } else {
                        countDownTimer.stopTimer()
                    }
                }) {
                    Text(timerStarted ? "Stop Timer" : "Start Timer")
                }
                TextField("Insert the timer value",
                          text: Binding(
                            get: {String(countDownTimer.timeRemaining)},
                            set: { newValue in if let floatValue = Float((newValue as NSString).trimmingCharacters(in: .whitespacesAndNewlines)) { self.countDownTimer.timeRemaining = floatValue }
                            })).textFieldStyle( RoundedBorderTextFieldStyle())
                    .padding()
            }
            HStack(alignment: .center){
                ProgressBarCircle(progress: self.$progressValue).padding(20).onAppear(){
                    self.progressValue = 0.2
                }
                ProgressBarCircle(progress: self.$cpuUsage).padding(20).onAppear(){
                    self.cpuUsage = 0.1
                }
                ProgressBarCircle(progress: self.$memoryUsage).padding(20).onAppear(){
                    self.memoryUsage = 0.4
                }
                
            }
        }
        .padding()
    }
}

#Preview {
    let model = CountdownModel()
    ContentView(countDownTimer: model)
}
