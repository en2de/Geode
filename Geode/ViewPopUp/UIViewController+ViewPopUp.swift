//
//  UIViewController+ViewPopUp.swift
//  Geode
//
//  Created by envy.chen on 03/10/2016.
//  Copyright © 2016 en2de.github.io. All rights reserved.
//

import Foundation
import UIKit

import Foundation

protocol PopupItemConvetiable: class {
    var shouldDimBackgound: Bool { get }
    var view: UIView { get }
    var finishPopupPresent: ((PopupItemConvetiable) -> Void)? { get set }
    
    var popupSize: CGSize { get }
    var popupOffset: CGPoint { get }
}

extension PopupItemConvetiable {
    var popupOffset: CGPoint {
        return .zero
    }
}

extension UIViewController {
    private class GEPopupCover: UIView {}
    
    func popup(item: PopupItemConvetiable) {
        let cover = GEPopupCover(frame: view.bounds).then { (view) in
            if item.shouldDimBackgound {
                view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
            }
        }
        
        cover.addSubview(preparePopup(item: item, position: cover.center))
        
        item.finishPopupPresent = { [unowned self] _ in
            self.popupDismiss()
        }
        
        view.addSubview(cover)
    }
    
    func preparePopup(item: PopupItemConvetiable, position: CGPoint) -> UIView {
        let view = item.view
        view.frame = CGRect(x: 0, y: 0, width: item.popupSize.width, height: item.popupSize.height)
        view.center = CGPoint(x: position.x + item.popupOffset.x, y: position.y + item.popupOffset.y)
        view.layoutIfNeeded()
        return view
    }
    
    func popupDismiss() {
        if let coverView = view.subviews.find({ $0 is GEPopupCover }) {
            coverView.removeFromSuperview()
        }
    }
}
