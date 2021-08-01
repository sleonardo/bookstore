//
//  TabViewModel.swift
//  Bookstore
//
//  Created by Leonardo Simoza on 20/07/21.
//

import Foundation

final class TabViewModel: ObservableObject {
    @Published var selectedTab: Tab = .library
    @Published var selected: Int = 1
    
    let tabItems = [
        TabItem(id: 1, title: Localizable.tabBarTitleLibrary.localized(), imageName: "IconTab1", type: .library),
        .init(id: 2, title: Localizable.tabBarTitleWishlist.localized(), imageName: "IconTab2", type: .wishlist),
        .init(id: 3, title: Localizable.tabBarTitleSuggest.localized(), imageName: "IconTab3", type: .suggest),
        .init(id: 4, title: Localizable.tabBarTitleRentals.localized(), imageName: "IconTab4", type: .rentals)
    ]
}
