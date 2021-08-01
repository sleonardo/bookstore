//
//  InitialView.swift
//  Bookstore
//
//  Created by Leonardo Simoza on 17/07/21.
//

import SwiftUI

let coloredNavAppearance = UINavigationBarAppearance()


struct InitialView: View {
    var body: some View {
        NavigationHostView()
            .environmentObject(NavigationStack(NavigationItem(view: AnyView(LoginView()))))
            
    }
}

struct Initial5View: View {
    var body: some View {
        NavigationView {
            LoginView()
                .transparentNavigation
                .ignoresSafeArea(.all, edges: .all)
        }
    }
}

struct InitialView_Previews: PreviewProvider {
    static var previews: some View {
        InitialView()
    }
}
