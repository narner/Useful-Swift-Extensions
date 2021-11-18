//
//  URL+Extension.swift
//  
//
//  Created by Nicholas Arner on 11/18/21.
//

import Foundation

extension URL {
   func getImageData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
}
