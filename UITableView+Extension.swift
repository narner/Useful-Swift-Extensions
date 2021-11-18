//
//  UITableView+Extension.swift
//  
//
//  Created by Nicholas Arner on 11/18/21.
//

import UIKit

extension UITableView {
    
    func hasRowAtIndexPath(indexPath: IndexPath) -> Bool {
        return indexPath.section < self.numberOfSections && indexPath.row < self.numberOfRows(inSection: indexPath.section)
    }
    
    func scrollToTop(animated: Bool) {
        let indexPathPinned = IndexPath(row: 0, section: 0)
        let indexPathUnPinned = IndexPath(row: 0, section: 1)

        if self.hasRowAtIndexPath(indexPath: indexPathPinned) {
            self.scrollToRow(at: indexPathPinned, at: .top, animated: animated)
        } else if self.hasRowAtIndexPath(indexPath: indexPathUnPinned) {
            self.scrollToRow(at: indexPathUnPinned, at: .top, animated: animated)
        }
    }
}

