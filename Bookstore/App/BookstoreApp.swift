//
//  BookstoreApp.swift
//  Bookstore
//
//  Created by Leonardo Simoza on 17/07/21.
//

import SwiftUI

@main
struct BookstoreApp: App {
    
    var body: some Scene {
        WindowGroup {
            InitialView().onAppear(){
                /// Validate that fonts are available
                let families = UIFont.familyNames
                families.sorted().forEach {
                    print("\($0)")
                    let names = UIFont.fontNames(forFamilyName: $0)
                    print(names)
                }
            }.transparentNavigation
        }
    }
}
