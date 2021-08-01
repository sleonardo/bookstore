//
//  NavigationHostView.swift
//  Bookstore
//
//  Created by Leonardo Simoza on 19/07/21.
//

import SwiftUI

struct NavigationHostView: View{
    @EnvironmentObject var navigation: NavigationStack
    var body: some View {
        self.navigation.currentView.view
    }
}

struct NavigationHostView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationHostView()
    }
}
