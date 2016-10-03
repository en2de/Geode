//
//  Then.swift
//  Geode
//
//  Created by envy.chen on 02/10/2016.
//  Copyright © 2016 en2de.github.io. All rights reserved.
//

import Foundation

public protocol Then: class {
}

extension Then {
    public func then(block: (Self) -> Void) -> Self {
        block(self)
        return self
    }
}

extension NSObject: Then {}
