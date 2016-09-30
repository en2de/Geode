//
//  Arbitrary.swift
//  Geode
//
//  Created by envy.chen on 30/09/2016.
//  Copyright © 2016 en2de.github.io. All rights reserved.
//

import Foundation

public protocol Arbitrary {
    static func arbitrary() -> Self
}
