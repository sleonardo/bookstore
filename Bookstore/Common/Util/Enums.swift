//
//  Enums.swift
//  Bookstore
//
//  Created by Leonardo Simoza on 18/07/21.
//

import Foundation

enum Localizable: String {
    case
    btnLogin = "btn-signIn",
    btnAddWishlist = "btn-add-wishlist",
    btnRent = "btn-rent",
    btnViewAll = "btn-viewAll",
    navTitleLibrary = "nav-title-library",
    navTitleBookDetail = "nav-title-bookDetail",
    navTitleWishlist = "nav-title-wishlist",
    navTitleSuggest = "nav-title-suggest",
    navTitleRentals = "nav-title-rentals",
    tabBarTitleLibrary = "tabBar-title-library",
    tabBarTitleWishlist = "tabBar-title-wishlist",
    tabBarTitleSuggest = "tabBar-title-suggest",
    tabBarTitleRentals = "tabBar-title-rentals",
    lblNoteWolox = "lbl-note-wolox",
    lblSearch = "lbl-search",
    lblSearchBooks = "lbl-search-books",
    lblNotImplemented = "lbl-not-implemented"
}

enum Tab: Hashable {
    case  library,
          wishlist,
          suggest,
          rentals
}


enum APIError: Error, LocalizedError {
    case unknown, apiError(reason: String), parserError(reason: String), networkError(from: URLError)

    var errorDescription: String? {
        switch self {
        case .unknown:
            return "Unknown error"
        case .apiError(let reason), .parserError(let reason):
            return reason
        case .networkError(let from):
            return from.localizedDescription
        }
    }
}
