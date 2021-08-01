//
//  SuggestView.swift
//  Bookstore
//
//  Created by Leonardo Simoza on 31/07/21.
//

import SwiftUI

struct SuggestView: View {
    @EnvironmentObject var navigation: NavigationStack
    
    var body: some View {
        ZStack {
            VStack {
                Header(isRoot: true, title: Localizable.navTitleRentals.localized(), hiddenNav: false) {
                    print("some")
                } onActionTrailing: {
                    print("some")
                }
                Spacer()
                Text(Localizable.tabBarTitleSuggest.localized())
                Spacer()
                
            }
        }.background(Color.mainBackground)
        .edgesIgnoringSafeArea(.all)
    }
}

struct SuggestView_Previews: PreviewProvider {
    static var previews: some View {
        SuggestView()
    }
}
