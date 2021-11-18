//
//  UIImage+Extension.swift
//  
//
//  Created by Nicholas Arner on 11/18/21.
//

extension UIImage {
    
    convenience init?(color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) {
      let rect = CGRect(origin: .zero, size: size)
      UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
      color.setFill()
      UIRectFill(rect)
      let image = UIGraphicsGetImageFromCurrentImageContext()
      UIGraphicsEndImageContext()
      
      guard let cgImage = image?.cgImage else { return nil }
      self.init(cgImage: cgImage)
    }
    
   func imageWithBorder(width: CGFloat, color: UIColor) -> UIImage? {
       let square = CGSize(width: min(size.width, size.height) + width * 2, height: min(size.width, size.height) + width * 2)
       let imageView = UIImageView(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: square))
       imageView.contentMode = .center
       imageView.image = self
       imageView.layer.borderWidth = width
       imageView.layer.borderColor = color.cgColor
       UIGraphicsBeginImageContextWithOptions(imageView.bounds.size, false, scale)
       guard let context = UIGraphicsGetCurrentContext() else { return nil }
       imageView.layer.render(in: context)
       let result = UIGraphicsGetImageFromCurrentImageContext()
       UIGraphicsEndImageContext()
       return result
   }
}
