//
//  UIView+Extensions.swift
//  Geode
//
//  Created by envy.chen on 30/09/2016.
//  Copyright © 2016 en2de.github.io. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    var width: CGFloat {
        get {
            return frame.width
        }
        set {
            var f = frame
            f.size.width = newValue
            frame = f
        }
    }
    
    var height: CGFloat {
        get {
            return frame.height
        }
        set {
            var f = frame
            f.size.height = newValue
            frame = f
        }
    }
    
    var top: CGFloat {
        get {
            return frame.minY
        }
        set {
            var f = frame
            f.origin.y = newValue
            frame = f
        }
    }
    
    var left: CGFloat {
        get {
            return frame.minX
        }
        set {
            var f = frame
            f.origin.x = newValue
            frame = f
        }
    }
    
    var bottom: CGFloat {
        get {
            return frame.maxY
        }
        set {
            top += newValue - bottom
        }
    }
    
    var right: CGFloat {
        get {
            return frame.maxX
        }
        set {
            left += newValue - right
        }
    }
}
