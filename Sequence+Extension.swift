//
//  Sequence+Extension.swift
//  
//
//  Created by Nicholas Arner on 11/18/21.
//

import Foundation

extension Sequence where Element: Hashable {
    func unique() -> [Element] {
        NSOrderedSet(array: self as! [Any]).array as! [Element]
    }
}

//https://stackoverflow.com/questions/39307188/removing-duplicates-from-array-of-custom-objects-swift
public extension Sequence {

    func uniq<Id: Hashable >(by getIdentifier: (Iterator.Element) -> Id) -> [Iterator.Element] {
        var ids = Set<Id>()
        return self.reduce([]) { uniqueElements, element in
            if ids.insert(getIdentifier(element)).inserted {
                return uniqueElements + CollectionOfOne(element)
            }
            return uniqueElements
        }
    }


    func uniq<Id: Hashable >(by keyPath: KeyPath<Iterator.Element, Id>) -> [Iterator.Element] {
      return self.uniq(by: { $0[keyPath: keyPath] })
   }
}

public extension Sequence where Iterator.Element: Hashable {

    var uniq: [Iterator.Element] {
        return self.uniq(by: { (element) -> Iterator.Element in
            return element
        })
    }

}
