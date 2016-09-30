//
//  UIColor+Extensions.swift
//  Geode
//
//  Created by envy.chen on 30/09/2016.
//  Copyright © 2016 en2de.github.io. All rights reserved.
//

import Foundation

extension UIColor {
    public class func from(hexString: String, alpha: CGFloat = 1.0) -> UIColor {
        var cString:String = hexString.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines).uppercased()
        if (cString.hasPrefix("#")) {
            cString = cString.substring(from: cString.index(after: cString.startIndex))
        }
        
        if cString.hasPrefix("0X") {
            let range = NSMakeRange(2, cString.characters.count - 2)
            cString=(cString as NSString).substring(with: range)
        }
        
        let rString = (cString as NSString).substring(to:2)
        let gString = ((cString as NSString).substring(with: NSMakeRange(2, 2)))
        let bString = ((cString as NSString).substring(with: NSMakeRange(4, 2)))
        
        var r:CUnsignedInt = 0, g:CUnsignedInt = 0, b:CUnsignedInt = 0;
        Scanner(string:rString).scanHexInt32(&r)
        Scanner(string:gString).scanHexInt32(&g)
        Scanner(string:bString).scanHexInt32(&b)
        
        return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: alpha)
    }
}
