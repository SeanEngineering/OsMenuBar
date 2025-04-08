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
    @Binding var countDownTimer: Float
    @State private var isKeyboardLocked: Bool = false
    @State private var isKeyboardHidden: Bool = false
    @State var progressValue: Float = 0.0
    @AppStorage("lockType") var lockType: LockType = .unlocked
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .center){
                Toggle("Lock keyboard", isOn: $isKeyboardLocked)
                    .toggleStyle(SwitchToggleStyle(tint: .blue))
            }
            HStack(alignment: .center){
                TextField("Insert the timer value",
                          text: Binding(
                            get: {String(countDownTimer)},
                            set: { newValue in if let floatValue = Float((newValue as NSString).trimmingCharacters(in: .whitespacesAndNewlines)) { self.countDownTimer = floatValue }
                            })).textFieldStyle( RoundedBorderTextFieldStyle())
                    .padding()
                                
            }
            HStack(alignment: .center){
            
                ProgressBarCircle(progress: self.$progressValue).padding(20).onAppear(){
                    self.progressValue = 0.3
                }
                
            }
        }
        .padding()
    }
}

#Preview {
    @State @Previewable var countDownTimer: Float = 0.0
    ContentView(countDownTimer: $countDownTimer)
}
