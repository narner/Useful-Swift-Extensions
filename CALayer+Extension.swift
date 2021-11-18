//
//  CALayer+Extension.swift
//  
//
//  Created by Nicholas Arner on 11/18/21.
//

import UIKit

extension CALayer {

   func bringToFront() {
      guard let sLayer = superlayer else {
         return
      }
      removeFromSuperlayer()
      sLayer.insertSublayer(self, at: UInt32(sLayer.sublayers?.count ?? 0))
   }

   func sendToBack() {
      guard let sLayer = superlayer else {
         return
      }
      removeFromSuperlayer()
      sLayer.insertSublayer(self, at: 0)
   }
}
