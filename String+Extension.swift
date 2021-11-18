//
//  String+Extension.swift
//  
//
//  Created by Nicholas Arner on 11/18/21.
//

import UIKit

extension String {
    
    func convertToDictionary(text: String) -> [String: Any]? {
        if let data = text.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }
    
    func isImage() -> Bool {
        // Add here your image formats.
        let imageFormats = ["jpg", "jpeg", "png", "gif", "JPG", "JPEG", "PNG", "GIF"]
        
        if let ext = self.getExtension() {
            return imageFormats.contains(ext)
        }
        
        return false
    }
    
    func getExtension() -> String? {
        let ext = (self as NSString).pathExtension
        
        if ext.isEmpty {
            return nil
        }
        
        return ext
    }
    
    func asURL() -> Bool {
        return URL(string: self) != nil
    }
    
    func separate(every: Int, separator: String) -> String {
        return String(stride(from: 0, to: Array(self).count, by: every).map {
            Array(Array(self)[$0..<min($0 + every, Array(self).count)])
        }.joined(separator: separator))
    }
    
    var isHTTPS: Bool {
        if( self.hasPrefix("https")){
            return true
        }
        return false
    }
    
    var isHTTP: Bool {
        if(self.hasPrefix("http")){
            return true
        }
        return false
    }
    
    var isValidURL: Bool {
        let detector = try! NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue)
        if let match = detector.firstMatch(in: self, options: [], range: NSRange(location: 0, length: self.utf16.count)) {
            // it is a link, if the match covers the whole string
            return match.range.length == self.utf16.count
        } else {
            return false
        }
    }
    
    var isImageURLString: Bool {
        let png = "png"
        let jpeg = "jpeg"
        let gif = "gif"
        
        if self.localizedCaseInsensitiveContains(gif) || self.localizedCaseInsensitiveContains(jpeg) || self.localizedCaseInsensitiveContains(png) {
            return true
        } else {
            return false
        }
    }
    
    func deletingPrefix(_ prefix: String) -> String {
        guard self.hasPrefix(prefix) else { return self }
        return String(self.dropFirst(prefix.count))
    }
    
    func insert(string:String,ind:Int) -> String {
        return  String(self.prefix(ind)) + string + String(self.suffix(self.count-ind))
    }
    
    func components(withMaxLength length: Int) -> [String] {
        return stride(from: 0, to: self.count, by: length).map {
            let start = self.index(self.startIndex, offsetBy: $0)
            let end = self.index(start, offsetBy: length, limitedBy: self.endIndex) ?? self.endIndex
            return String(self[start..<end])
        }
    }
}
