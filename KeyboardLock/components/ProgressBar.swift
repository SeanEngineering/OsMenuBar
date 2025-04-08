//
//  Untitled.swift
//  KeyboardLock
//
//  Created by Sean on 8/4/2025.
//
import Foundation
import SwiftUI

struct ProgressBarCircle: View {
    @Binding var progress: Float
    var color: Color = Color.green
    
    var body: some View {
        ZStack {
            Circle().stroke(lineWidth: 20.0)
                .opacity(0.20)
                .foregroundColor(Color.gray)
            Text("\($progress.wrappedValue * 100, format: .number.precision(.fractionLength(2)))%").font(.system(size: 25, weight: .bold, design: .default))
            Circle()
                .trim(from: 0.0, to: CGFloat(min(self.progress, 1.0)))
                .stroke(style: StrokeStyle(lineWidth: 12.0, lineCap: .round, lineJoin: .round))
                .foregroundColor(color)
                .rotationEffect(Angle(degrees: 275)) // Adjusted to rotate correctly from top
                .animation(.easeInOut(duration: 1.0)) // Adjusted animation timing
        }.scaleEffect(0.5).frame(width: 150, height: 150)
    }
}
