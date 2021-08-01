//
//  NavigationBarModifier.swift
//  Bookstore
//
//  Created by Leonardo Simoza on 18/07/21.
//

import SwiftUI

struct NavigationBarModifier: ViewModifier {
  var backgroundColor: UIColor
  var textColor: UIColor

  init(backgroundColor: UIColor, textColor: UIColor) {
    self.backgroundColor = backgroundColor
    self.textColor = textColor
    let coloredAppearance = UINavigationBarAppearance()
    coloredAppearance.configureWithTransparentBackground()
    coloredAppearance.backgroundColor = .clear
    coloredAppearance.titleTextAttributes = [.foregroundColor: textColor]
    coloredAppearance.largeTitleTextAttributes = [.foregroundColor: textColor]

    UINavigationBar.appearance().standardAppearance = coloredAppearance
    UINavigationBar.appearance().compactAppearance = coloredAppearance
    UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
    UINavigationBar.appearance().tintColor = textColor
  }

  func body(content: Content) -> some View {
    ZStack {
       content
        VStack {
          GeometryReader { geometry in
             Color(self.backgroundColor)
                .frame(height: geometry.safeAreaInsets.top)
                .edgesIgnoringSafeArea(.top)
              Spacer()
          }
        }
     }
  }
}

extension UINavigationController {
    override open func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        navigationBar.standardAppearance = appearance
        navigationBar.compactAppearance = appearance
        navigationBar.scrollEdgeAppearance = appearance
    }
}
