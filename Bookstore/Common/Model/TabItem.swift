//
//  TabItem.swift
//  Bookstore
//
//  Created by Leonardo Simoza on 20/07/21.
//

import Foundation

// MARK: - TabItem
struct TabItem: Hashable {
    let id: Int
    let title: String
    let imageName: String
    let type: Tabs
    
    enum Tabs: Hashable {
        case
        library,
        wishlist,
        suggest,
        rentals
    }
}
