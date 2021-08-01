//
//  SplashView.swift
//  Bookstore
//
//  Created by Leonardo Simoza on 17/07/21.
//

import SwiftUI

// MARK: -
struct SplashView: View {
    // MARK: Variables and Constants -
    static var animate = true
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color.launchBackground
                Image("BackgroundInitial")
                    .resizable()
                    .aspectRatio(geometry.size, contentMode: .fill)
                                        .edgesIgnoringSafeArea(.all)
            }
            .ignoresSafeArea(.all, edges: .all)
        }
    }
}

// MARK: -
struct SplashView_Previews: PreviewProvider {
    // MARK: Previews -
    static var previews: some View {
        SplashView()
    }
}
