//
//  RentalsView.swift
//  Bookstore
//
//  Created by Leonardo Simoza on 24/07/21.
//

import SwiftUI

struct RentalsView: View {
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
                Text(Localizable.lblNotImplemented.localized())
                Spacer()
                
            }
        }.background(Color.mainBackground)
        .edgesIgnoringSafeArea(.all)
    }
}

struct RentalsView_Previews: PreviewProvider {
    static var previews: some View {
        RentalsView()
    }
}

