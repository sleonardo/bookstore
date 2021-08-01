//
//  NavigationStack.swift
//  Bookstore
//
//  Created by Leonardo Simoza on 19/07/21.
//

import SwiftUI

final class NavigationStack: ObservableObject {
    @Published var viewStack: [NavigationItem] = []
    @Published var currentView: NavigationItem
    @Published var titleView = Localizable.navTitleLibrary.localized()
    
    
    init(_ currentView: NavigationItem ){
        self.currentView = currentView
    }

    func unwind(){
        if viewStack.count == 0{
            return
        }
        let last = viewStack.count - 1
        currentView = viewStack[last]
        viewStack.remove(at: last)
    }
    
    func advance(_ view:NavigationItem, title: String){
        viewStack.append( currentView)
        currentView = view
        titleView = title
    }
    
    func home(){
        currentView = NavigationItem( view: AnyView(TabMainView()))
        titleView = Localizable.navTitleLibrary.localized()
        viewStack.removeAll()
    }
    
    func rentals(){
        currentView = NavigationItem( view: AnyView(TabMainView()))
        titleView = Localizable.navTitleRentals.localized()
        viewStack.removeAll()
    }
}
