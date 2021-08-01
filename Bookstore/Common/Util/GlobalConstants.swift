//
//  GlobalConstants.swift
//  Bookstore
//
//  Created by Leonardo Simoza on 18/07/21.
//

import UIKit

struct Constants {
    struct DeviceBase {
        static let width: CGFloat = 375
        static let height: CGFloat = 667
        static let widthTablet: CGFloat = 768
        static let heightTablet: CGFloat = 1024
    }
    
    struct PathWS {
        static let apiURL: String = "https://private-59a7d9-iostrainingapi.apiary-mock.com"
        static let books: String = "/books"
        static let comments: String = "/comments"
        static let suggestions: String = "/suggestions"
    }
}
