//
//  TabMainView.swift
//  Bookstore
//
//  Created by Leonardo Simoza on 20/07/21.
//

import SwiftUI

struct TabMainView: View {
    @StateObject var tabViewModel = TabViewModel()
    @EnvironmentObject var navigation: NavigationStack
    var body: some View {
        BaseView(title: navigation.titleView, hiddenNav: tabViewModel.selectedTab == .library ? true : false, isRoot: true) {
            print("test")
        } onActionTrailing: {
            print("test")
        } content: {
            mainTabView
        }
    }
}

// MARK: Tab main container view
private extension TabMainView {
    var mainTabView : some View {
        TabView(selection: $tabViewModel.selected) {
            ForEach(tabViewModel.tabItems, id: \.self) { tab in
                switch tab.type {
                case .wishlist:
                    WishlistView()
                        .tabItem(tab.title, imageName: tab.imageName, index: tab.id, selection: $tabViewModel.selected)
                case .suggest:
                    SuggestView()
                        .tabItem(tab.title, imageName: tab.imageName, index: tab.id, selection: $tabViewModel.selected)
                case .rentals:
                    RentalsView()
                        .tabItem(tab.title, imageName: tab.imageName, index: tab.id, selection: $tabViewModel.selected)
                default:
                    BookstoreView()
                        .tabItem(tab.title, imageName: tab.imageName, index: tab.id, selection: $tabViewModel.selected)
                }
            }
        }.id(tabViewModel.selected)
        .edgesIgnoringSafeArea(.all)
        .onAppear() {
            onAppearTabBar()
        }
    }
    
    func onAppearTabBar() {
        let standardAppearance = UITabBarAppearance()
            
        standardAppearance.backgroundColor = UIColor.tabBarColor
        let image = UIImage.gradientImageWithBounds(
            bounds: CGRect( x: 2, y: 0.6, width: UIScreen.main.scale, height: 5),
            colors: [
                UIColor.clear.cgColor,
                UIColor.black.withAlphaComponent(0.3).cgColor
            ]
        )
        standardAppearance.shadowImage = image

        standardAppearance.stackedLayoutAppearance.selected.iconColor = UIColor.tabBarTitleColor

        standardAppearance.stackedLayoutAppearance.focused.titleTextAttributes = [.foregroundColor: UIColor.black.withAlphaComponent(0.5)]
        standardAppearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.black.withAlphaComponent(0.5)]
        standardAppearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.tabBarTitleColor]
        
        UITabBar.appearance().standardAppearance = standardAppearance
    }
}

struct TabMainView_Previews: PreviewProvider {
    static var previews: some View {
        TabMainView()
    }
}
