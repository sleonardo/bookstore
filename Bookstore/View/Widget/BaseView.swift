//
//  BaseView.swift
//  Bookstore
//
//  Created by Leonardo Simoza on 20/07/21.
//

import SwiftUI

struct BaseView<Content: View>: View {
    // MARK: - Variables and Constants
    @EnvironmentObject var navigation: NavigationStack
    @State var showSearch = false
    @ObservedObject var bookstoreViewModel: BookstoreViewModel = BookstoreViewModel()
    
    var isRoot: Bool = false
    var title: String = Localizable.navTitleLibrary.localized()
    let hiddenNav: Bool
    let onActionLeading: () -> Void
    let onActionTrailing: () -> Void
    let content: Content
    
    // MARK: - Initialization
    init(title: String,
         hiddenNav: Bool, isRoot: Bool,
         onActionLeading: @escaping () -> Void,
         onActionTrailing: @escaping () -> Void,
         @ViewBuilder content: () -> Content) {
        self.title = title
        self.hiddenNav = hiddenNav
        self.isRoot = isRoot
        self.onActionLeading = onActionLeading
        self.onActionTrailing = onActionTrailing
        self.content = content()
    }
    
    var body: some View {
        // To-do: The most important part will go here
        ZStack(alignment: .top) {
            VStack {
                Header(isRoot: isRoot, title: title, hiddenNav: hiddenNav, onActionLeading: onActionLeading, onActionTrailing: onActionTrailing)
                content
            }
        }.background(Color.mainBackground)
        .edgesIgnoringSafeArea(.all)
    }
}


struct BaseView_Previews: PreviewProvider {
    static var previews: some View {
        BaseView(title: "", hiddenNav: false, isRoot: true) {
            print("test")
        } onActionTrailing: {
            print("test")
        } content: {
            EmptyView()
        }
    }
}
