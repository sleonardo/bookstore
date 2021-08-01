//
//  Helper.swift
//  Bookstore
//
//  Created by Leonardo Simoza on 17/07/21.
//

import Foundation
import UIKit

enum TypePosition{
    case Width
    case Height
}

class Helper{
    
    static func sizeScaleWidth(_ size:CGFloat)-> CGFloat{
        let isPaid = UIDevice.current.userInterfaceIdiom == .pad
        let deviceWidth = isPaid ? Constants.DeviceBase.widthTablet : Constants.DeviceBase.width
        return sizeScale(size, deviceWidth, TypePosition.Width);
    }
    
    static func sizeScaleHeight(_ size:CGFloat) -> CGFloat {
        let isPaid = UIDevice.current.userInterfaceIdiom == .pad
        let deviceHeight = isPaid ? Constants.DeviceBase.heightTablet : Constants.DeviceBase.height
        return sizeScale(size, deviceHeight, TypePosition.Height)
    }

    static func  sizeScale(_ size : CGFloat,_  sizereference: CGFloat,_  position: TypePosition) -> CGFloat {
        let Screen =  UIScreen.main.bounds.size
        var newPropotion: CGFloat = 0.0

      if (position == TypePosition.Height) {
        newPropotion = (Screen.height * (size / sizereference));
      } else {
        newPropotion = (Screen.width * (size / sizereference));
      }

      return newPropotion
    }
}
