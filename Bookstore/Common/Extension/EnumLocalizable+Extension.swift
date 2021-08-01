//
//  EnumLocalizable+Extension.swift
//  Bookstore
//
//  Created by Leonardo Simoza on 18/07/21.
//

import Foundation

extension Localizable {
    func localized(bundle: Bundle = .main, tableName: String = "Localizable") -> String {
        return NSLocalizedString(self.rawValue, tableName: tableName, value: "**\(self)**", comment: "")
    }
}
