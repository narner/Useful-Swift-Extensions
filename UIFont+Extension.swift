//
//  UIFont+Extension.swift
//  
//
//  Created by Nicholas Arner on 11/18/21.
//

import UIKit

extension UIFont {
  func withWeight(_ weight: UIFont.Weight) -> UIFont {
    let newDescriptor = fontDescriptor.addingAttributes([.traits: [
      UIFontDescriptor.TraitKey.weight: weight]
    ])
    return UIFont(descriptor: newDescriptor, size: pointSize)
  }
}
