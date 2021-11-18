//
//  NSMutableAttributedString+Extension.swift
//  
//
//  Created by Nicholas Arner on 11/18/21.
//

import UIKit

extension NSMutableAttributedString {

 func setColorForText(textForAttribute: String, withColor color: UIColor) {
        let range: NSRange = self.mutableString.range(of: textForAttribute, options: .caseInsensitive)
        self.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
    }

    func setColorForAllOccuranceOfText(_ textToFind: String, with color: UIColor) {
        let inputLength = self.string.count
        let searchLength = textToFind.count
        var range = NSRange(location: 0, length: self.length)

        while (range.location != NSNotFound) {
            range = (self.string as NSString).range(of: textToFind, options: [], range: range)
            if (range.location != NSNotFound) {
                self.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: NSRange(location: range.location, length: searchLength))
                range = NSRange(location: range.location + range.length, length: inputLength - (range.location + range.length))
            }
        }
    }
}
