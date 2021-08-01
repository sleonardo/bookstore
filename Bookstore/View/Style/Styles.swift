//
//  Styles.swift
//  Bookstore
//
//  Created by Leonardo Simoza on 18/07/21.
//

import SwiftUI

struct PrimaryButtonStyle: ButtonStyle {
    
    let backgroundColor: Color
    let foregroundColor: Color
    let isDisabled: Bool
    var width: CGFloat = 255
    var height: CGFloat = 44
    
    func makeBody(configuration: Self.Configuration) -> some View {
        let currentForegroundColor = isDisabled || configuration.isPressed ? foregroundColor.opacity(0.3) : foregroundColor
        return configuration.label
            .padding(.top, Helper.sizeScaleHeight(14))
            .padding(.bottom, Helper.sizeScaleHeight(11))
            .padding(.horizontal, Helper.sizeScaleWidth(30))
            .frame(width: Helper.sizeScaleWidth(width), height: Helper.sizeScaleWidth(height), alignment: .center)
            .foregroundColor(currentForegroundColor)
            .background(isDisabled || configuration.isPressed ? backgroundColor.opacity(0.3) : backgroundColor)
            .cornerRadius(100)
            // This is the key part, we are using both an overlay as well as cornerRadius
            .overlay(
                RoundedRectangle(cornerRadius: 100)
                    .stroke(currentForegroundColor, lineWidth: 1.5)
            )
            .scaleEffect(configuration.isPressed ? 0.95: 1)
            .animation(.spring())
    }
}

struct GradientButtonStyle: ButtonStyle {
    let gradientDefault = [Color.buttomFillGradientB1Color, Color.buttomFillGradientB2Color]
    let backgroundColor: Color
    let foregroundColor: Color
    var gradientColors: [Color] = []
    let isDisabled: Bool
    var width: CGFloat = 255
    var height: CGFloat = 44
    
    func makeBody(configuration: Self.Configuration) -> some View {
        let currentForegroundColor = isDisabled || configuration.isPressed ? foregroundColor.opacity(0.42) : foregroundColor
        configuration.label
            .padding(.top, Helper.sizeScaleHeight(14))
            .padding(.bottom, Helper.sizeScaleHeight(11))
            .padding(.horizontal, Helper.sizeScaleWidth(30))
            .frame(width: Helper.sizeScaleWidth(width), height: Helper.sizeScaleWidth(height), alignment: .center)
            .foregroundColor(currentForegroundColor)
            .background(LinearGradient(gradient: Gradient(colors: gradientColors.count == 0 ? gradientDefault : gradientColors ), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(100)
            // This is the key part, we are using both an overlay as well as cornerRadius
            .overlay(
                RoundedRectangle(cornerRadius: 100)
                    .stroke(currentForegroundColor, lineWidth: 1.5)
            )
            .scaleEffect(configuration.isPressed ? 0.95: 1)
            .animation(.spring())
    }
}
