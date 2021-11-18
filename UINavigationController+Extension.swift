//
//  UINavigationController+Extension.swift
//  
//
//  Created by Nicholas Arner on 11/18/21.
//

import UIKit

extension UINavigationController {
    func transparentNavigationBar() {
        self.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.isTranslucent = true
    }

    func setTintColor(_ color: UIColor) {
        self.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: color]
        self.navigationBar.tintColor = color
    }

    func setBackgroundColor(_ color: UIColor) {
        navigationBar.setBackgroundImage(nil, for: .default)
        navigationBar.barTintColor = color
        navigationBar.shadowImage = UIImage()
    }
}
