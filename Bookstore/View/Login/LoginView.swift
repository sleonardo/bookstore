//
//  LoginView.swift
//  Bookstore
//
//  Created by Leonardo Simoza on 17/07/21.
//

import SwiftUI

struct LoginView: View {
    // MARK: - Variables and Constants
    @State var showLogin = false
    @State private var action: Int? = 0
    @State var selection: Int? = nil
    @State var isLinkActive = false
    @EnvironmentObject var navigation: NavigationStack
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                // Show splash with timer in Appear
                SplashView()
                    .ignoresSafeArea(.all, edges: .all)
                if self.showLogin {
                    // Show login after timer
                    VStack(alignment: .center) {
                        Spacer()
                        Image("Logo")
                            .renderingMode(.original)
                            .resizable()
                            .scaledToFit()
                            .frame(width: Helper.sizeScaleWidth(184),
                                   height: Helper.sizeScaleWidth(135),
                                   alignment: .center)
                            .padding(.bottom, Helper.sizeScaleHeight(94))
                            .accessibilityIdentifier("imageLogo")
                        Button(action: {
                            print("sign in tapped")
                            self.navigation.home()
                            
                        }) {
                            Text(Localizable.btnLogin.localized().uppercased())
                                .modifier(ButtonTitle())
                                .lineSpacing(HelperFont.LineSpacing.lh19.rawValue)
                                .fixedSize()
                        }.buttonStyle(
                            PrimaryButtonStyle(backgroundColor: .clear,
                                               foregroundColor: .white,
                                               isDisabled: false))
                        .padding(.bottom, Helper.sizeScaleHeight(170))
                        .accessibility(identifier: "btnLogin")
                        Text(Localizable.lblNoteWolox.localized())
                            .tracking(HelperFont.LetterSpacing.ls029.rawValue)
                            .modifier(Caption())
                            .padding(.bottom, Helper.sizeScaleHeight(31))
                            .accessibilityIdentifier("lblNoteWolox")
                        
                    }
                }
            }.onAppear {
                // Added a timer to be able to transition views
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                    // Activate Login
                    withAnimation {
                        self.showLogin = true
                    }
                }
            }.ignoresSafeArea(.all, edges: .all)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
