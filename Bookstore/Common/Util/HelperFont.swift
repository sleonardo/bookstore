//
//  HelperFont.swift
//  Bookstore
//
//  Created by Leonardo Simoza on 18/07/21.
//

import SwiftUI
import UIKit
import Foundation
struct HelperFont {

    // 1. Prepare base materials
    
    /// a. Level 1 base settings
    enum FontSize: CGFloat {
        case
        size10 = 10,
        size12 = 12,
        size14 = 14,
        size15 = 15,
        size17 = 17,
        size24 = 24
    }
    
    enum LineSpacing: CGFloat {
        case
        lh1178 = 1.178,
        lh14 = 1.1666666666666667,
        lh16 = 1.1428571428571428,
        lh1767 = 1.1780000000000002,
        lh19 = 1.2666666666666666,
        lh20 = 1.1764705882352942,
        lh25 = 1.0416666666666667,
        lh2827 = 1.1779166666666667
    }
    
    enum LetterSpacing: CGFloat {
        case
        ls012 = 0.12,
        ls015 = -0.15,
        ls024 = -0.24,
        ls029 = -0.29,
        ls036 = -0.36,
        ls041 = -0.41,
        ls058 = -0.58
    }
    
    private enum FontFamily: String {
        case
        SFUIText = "SF UI Text",
        HelveticaNeue = "Helvetica Neue"
    }
    
    /// b. Level 2 Style
    enum FSStyle: CGFloat {
        case h1, h2, h3, h4, p1, p2, p3, p4, buttons
        
        func getValue() -> CGFloat {
            switch self {
            case .h1:
                return FontSize.size24.rawValue
            case .h2:
                return FontSize.size17.rawValue
            case .h3:
                return FontSize.size17.rawValue
            case .h4:
                return FontSize.size15.rawValue
            case .p1:
                return FontSize.size15.rawValue
            case .p2:
                return FontSize.size12.rawValue
            case .p3:
                return FontSize.size10.rawValue
            case .p4:
                return FontSize.size15.rawValue
            case .buttons:
                return FontSize.size15.rawValue
            }
        }
    }
    enum FFamily: String {
        case main, sub
        
        func getValue() -> String {
            switch self {
            case .main:
                return FontFamily.SFUIText.rawValue
            case .sub:
                return FontFamily.HelveticaNeue.rawValue
            }
        }
    }

    // 2. Expose data
    let buttons: Font!
    /// .caption -  P3
    let caption: Font!
    /// .footnote -  P2
    let footnote: Font!
    /// .subheadline - P1
    let subheadline: Font!
    /// .callout - P4
    let callout: Font!
    /// .body - H4
    let body: Font!
    /// .headline - H3
    let headline: Font!
    /// .title - H2
    let title: Font!
    /// .largeTitle -H1
    let largeTitle: Font!

    init() {
        self.buttons = Font.custom(FFamily.main.getValue(), size: FSStyle.buttons.getValue())
        /// .caption - Regular P3
        self.caption = Font.custom(FFamily.main.getValue(), size: FSStyle.p3.getValue())
        /// .footnote - Regular P2
        self.footnote = Font.custom(FFamily.main.getValue(), size: FSStyle.p2.getValue())
        /// .subheadline - P1
        self.subheadline = Font.custom(FFamily.main.getValue(), size: FSStyle.p1.getValue())
        /// .callout - P4
        self.callout = Font.custom(FFamily.main.getValue(), size: FSStyle.p4.getValue())
        /// .body - H4
        self.body = Font.custom(FFamily.main.getValue(), size: FSStyle.h4.getValue(), relativeTo: .body)
        /// .headline - H3
        self.headline = Font.custom(FFamily.main.getValue(), size: FSStyle.h3.getValue())
        /// .title - H2
        self.title = Font.custom(FFamily.main.getValue(), size: FSStyle.h2.getValue())
        /// .largeTitle -H1
        self.largeTitle = Font.custom(FFamily.main.getValue(), size: FSStyle.h1.getValue())
    }
}

extension HelperFont {
    static let FStyle = HelperFont()
}

struct ButtonTitle: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(HelperFont.FStyle.buttons)
            .lineSpacing(HelperFont.LineSpacing.lh19.rawValue)
            .foregroundColor(.white)
    }
}

struct Caption: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(HelperFont.FStyle.caption)
            .lineSpacing(HelperFont.LineSpacing.lh14.rawValue)
            .foregroundColor(Color.textPrimaryColor)
    }
}

struct Footnote: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(HelperFont.FStyle.footnote)
            .lineSpacing(HelperFont.LineSpacing.lh14.rawValue)
            .foregroundColor(Color.textPrimaryColor)
    }
}

struct Subheadline: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(HelperFont.FStyle.subheadline)
            .lineSpacing(HelperFont.LineSpacing.lh14.rawValue)
            .foregroundColor(Color.textPrimaryColor)
    }
}

struct Callout: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(HelperFont.FStyle.callout)
            .lineSpacing(HelperFont.LineSpacing.lh14.rawValue)
            .foregroundColor(Color.textPrimaryColor)
    }
}

struct BodyStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(HelperFont.FStyle.body)
            .lineSpacing(HelperFont.LineSpacing.lh14.rawValue)
            .foregroundColor(Color.textPrimaryColor)
    }
}

struct Headline: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(HelperFont.FStyle.headline)
            .lineSpacing(HelperFont.LineSpacing.lh20.rawValue)
            .foregroundColor(Color.textPrimaryColor)
    }
}

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(HelperFont.FStyle.title)
            .lineSpacing(HelperFont.LineSpacing.lh14.rawValue)
            .foregroundColor(Color.textPrimaryColor)
    }
}

struct LargeTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(HelperFont.FStyle.title)
            .lineSpacing(HelperFont.LineSpacing.lh2827.rawValue)
            .foregroundColor(Color.textPrimaryColor)
    }
}
