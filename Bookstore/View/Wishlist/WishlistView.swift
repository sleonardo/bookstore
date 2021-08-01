//
//  WishlistView.swift
//  Bookstore
//
//  Created by Leonardo Simoza on 22/07/21.
//

import SwiftUI

struct WishlistView: View {
    let gradient = Gradient(colors: [Color.mainBackground, .white])
    @EnvironmentObject var navigation: NavigationStack
    
    var body: some View {
        ZStack {
            VStack {
                Header(isRoot: true, title: Localizable.navTitleWishlist.localized(), hiddenNav: false) {
                    print("some")
                } onActionTrailing: {
                    print("some")
                }
                Spacer()
                Text(Localizable.tabBarTitleWishlist.localized())
                Spacer()
                
            }
        }.background(Color.mainBackground)
        .edgesIgnoringSafeArea(.all)
    }
}
