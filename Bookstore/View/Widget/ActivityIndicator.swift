//
//  ActivityIndicator.swift
//  Bookstore
//
//  Created by Leonardo Simoza on 19/07/21.
//

import SwiftUI

struct ActivityIndicator: View {
    
    @State var animateTrimPath = false
    @State var rotaeInfinity = false
    
    var body: some View {
        
        ZStack {
            Color.secondaryColor.opacity(0.78)
                .edgesIgnoringSafeArea(.all)
            ZStack {
                Path { path in
                    path.addLines([
                        .init(x: 2, y: 1),
                        .init(x: 1, y: 0),
                        .init(x: 0, y: 1),
                        .init(x: 1, y: 2),
                        .init(x: 3, y: 0),
                        .init(x: 4, y: 1),
                        .init(x: 3, y: 2),
                        .init(x: 2, y: 1)
                    ])
                }
                .trim(from: animateTrimPath ? 1/0.99 : 0, to: animateTrimPath ? 1/0.99 : 1)
                .scale(5, anchor: .topLeading)
                .stroke(Color.white, lineWidth: 8)
                .offset(x: 45, y: 15)
                .animation(Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true))
                .onAppear() {
                    self.animateTrimPath.toggle()
                }
            }
            .rotationEffect(.degrees(rotaeInfinity ? 0 : -360))
            .scaleEffect(0.24, anchor: .center)
            .animation(Animation.easeInOut(duration: 1.5)
                        .repeatForever(autoreverses: false))
            .onAppear(){
                self.rotaeInfinity.toggle()
            }
        }
    }
}

struct SlidingCirclesView: View {
    
    @State private var shouldAnimate = false
    @State var leftOffset: CGFloat = -100
    @State var rightOffset: CGFloat = 100
    
    var body: some View {
        
        GeometryReader { geometry in
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.launchBackground.opacity(0.3))
                .frame(width: geometry.size.width, height: 10)
                .offset(x: shouldAnimate ? rightOffset : leftOffset)
                .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true))
                .onAppear {
                    self.shouldAnimate = true
                }
        }
    }
    
}
