//
//  View+Extension.swift
//  Bookstore
//
//  Created by Leonardo Simoza on 18/07/21.
//

import SwiftUI

extension View {
    var transparentNavigation: some View {
        self.navigationBarColor(.clear, textColor: UIColor.white)
    }
    
    func navigationBarColor(_ backgroundColor: UIColor, textColor: UIColor) -> some View {
        self.modifier(NavigationBarModifier(backgroundColor: backgroundColor, textColor: textColor))
    }
    
    func tabItem<Selection>(
        _ text: String,
        imageName: String,
        index: Selection,
        selection: Binding<Selection>
    ) -> some View where Selection: Hashable {
        modifier(TabViewItem(selectedIndex: selection, index: index, text: text, imageName: imageName))
    }
}
