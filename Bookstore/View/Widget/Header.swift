//
//  Header.swift
//  Bookstore
//
//  Created by Leonardo Simoza on 20/07/21.
//

import SwiftUI

struct Header: View{
    @EnvironmentObject var navigation: NavigationStack
    @ObservedObject var bookstoreViewModel: BookstoreViewModel = BookstoreViewModel()
    @State var showSearch = false
    
    var isRoot: Bool = false
    var title: String = Localizable.navTitleLibrary.localized()
    let hiddenNav: Bool
    let onActionLeading: () -> Void
    let onActionTrailing: () -> Void

    var body: some View {
        if (!self.hiddenNav) {
            GeometryReader { geometry in
                
                HStack(alignment: .top, spacing: 0) {
                    
                    Button( action: onActionLeading){
                        Image(isRoot ? "IconNotification" : "IconBack")
                            .renderingMode(.original)
                            .frame(width: Helper.sizeScaleWidth(18), height: Helper.sizeScaleHeight(18), alignment: .center)
                            .padding(.leading, Helper.sizeScaleWidth(13))
                    }
                    Spacer()
                    Text(title.uppercased())
                        .foregroundColor(.white)
                        .modifier(Headline())
                    Spacer()
                    Button( action: {
                        self.showSearch.toggle()
                    }){
                        Image("IconSearch")
                            .renderingMode(.original)
                            .frame(width: Helper.sizeScaleWidth(18), height: Helper.sizeScaleHeight(18), alignment: .center)
                            .padding(.trailing, Helper.sizeScaleWidth(13))
                    }.disabled(!isRoot)
                    .opacity(isRoot ? 1 : 0)
                    .animation(.spring())
                    
                }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, idealHeight: Helper.sizeScaleHeight(101), maxHeight: Helper.sizeScaleHeight(101), alignment: .center)
                .padding(.top,Helper.sizeScaleHeight(0))
                .edgesIgnoringSafeArea(.top)
                .background(Image("NavigationBar")
                                .renderingMode(.original)
                                .resizable()
                                .scaledToFill()
                                .frame(width: Helper.sizeScaleWidth(geometry.size.width), height: Helper.sizeScaleHeight(101), alignment: .top).edgesIgnoringSafeArea(.top))
                
            }.frame(height: Helper.sizeScaleHeight(101), alignment: .top)
        }
    }
    
    func homeAction() {
        print("TAP button")
    }
}


struct Header_Previews: PreviewProvider {
    static var previews: some View {
        Header(hiddenNav: false, onActionLeading: {print("")}, onActionTrailing: {print("")})
    }
}
