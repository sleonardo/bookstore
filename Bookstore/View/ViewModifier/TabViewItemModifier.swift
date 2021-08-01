//
//  SearchBar.swift
//  Bookstore
//
//  Created by Leonardo Simoza on 28/07/21.
//

import SwiftUI

public struct TabViewItem<SelectionValue>: ViewModifier where SelectionValue: Hashable {
    @Binding private var selectedIndex: SelectionValue
    private let index: SelectionValue
    private let text: String
    private let imageName: String

    public init(selectedIndex: Binding<SelectionValue>, index: SelectionValue, text: String, imageName: String) {
        self._selectedIndex = selectedIndex
        self.index = index
        self.text = text
        self.imageName = imageName
    }

    public func body(content: Content) -> some View {
        content
            .tabItem {
                Image(imageName)
                    .renderingMode(.template)
                    .frame(width: 20, height: 20, alignment: .center)
                Text(text)
            }
            .tag(index)
    }
}
