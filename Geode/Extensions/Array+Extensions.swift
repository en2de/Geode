//
//  Array+Extensions.swift
//  Geode
//
//  Created by envy.chen on 30/09/2016.
//  Copyright © 2016 en2de.github.io. All rights reserved.
//

import Foundation

public extension Array {
    public func find(_ match: (Element) -> Bool) -> Element? {
        for element in self where match(element) {
            return element
        }
        return nil
    }
    
    public func accumulate<U>(_ initial: U, combine: (U, Element) -> U) -> [U] {
        var running = initial
        return self.map { next in
            running = combine(running, next)
            return running
        }
    }
    
    public func allMatch(_ predicate: (Element) -> Bool) -> Bool {
        return !self.contains { !predicate($0) }
    }
    
    public func noneMatch(_ predicate: (Element) -> Bool) -> Bool {
        return !self.contains(where: predicate)
    }
    
    public func count(_ includeElement: (Element) -> Bool) -> Int {
        return reduce(0) { includeElement($1) ? $0 + 1 : $0 }
    }
    
    public func indicesOf(_ predicate: (Element) -> Bool) -> [Index] {
        return enumerated().flatMap({ (index, element) -> Index? in
            return predicate(element) ? index : nil
        })
    }
    
    public func takeWhile(_ predicate: (Element) -> Bool) -> [Element] {
        var result = [Element]()
        for i in self {
            if !predicate(i) {
                return result
            }
            result.append(i)
        }
        return result
    }
    
    public func dropWhile(_ predicate: (Element) -> Bool) -> [Element] {
        var result = self
        for i in self {
            if !predicate(i) {
                return result
            }
            result.removeFirst()
        }
        return result
    }
}
