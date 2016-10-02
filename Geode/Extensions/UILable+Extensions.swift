//
//  UILable+Extensions.swift
//  Geode
//
//  Created by envy.chen on 02/10/2016.
//  Copyright © 2016 en2de.github.io. All rights reserved.
//

import Foundation
import UIKit

public extension UILabel {
    convenience init(textColor: UIColor, font: UIFont, textAlignment: NSTextAlignment = .left, text: String? = nil) {
        self.init(frame: CGRect())
        
        self.textColor = textColor
        self.font = font
        self.textAlignment = textAlignment
        
        self.text = text
        
        sizeToFit()
    }
}
