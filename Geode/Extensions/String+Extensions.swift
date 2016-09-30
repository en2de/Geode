//
//  String+Extensions.swift
//  Geode
//
//  Created by envy.chen on 30/09/2016.
//  Copyright © 2016 en2de.github.io. All rights reserved.
//

import Foundation

extension String {
    func dropPrefixed(_ prefix: String) -> String {
        if hasPrefix(prefix) {
            return substring(from: prefix.endIndex)
        }
        return self
    }
    
    mutating func dropPrefix(_ prefix: String) {
        self = dropPrefixed(prefix)
    }
}
