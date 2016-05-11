//
//  UIView+IBInspectable.swift
//  iOSTestApp
//
//  Created by X-User on 5/11/16.
//  Copyright © 2016 Zakhar Kozlov. All rights reserved.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = borderWidth
        }
    }
    @IBInspectable var borderColor: UIColor? {
        get {
            return layer.borderColor?.UIColor
        }
        set {
            layer.borderColor = borderColor?.CGColor
        }
    }
}

extension CGColor {
    private var UIColor: UIKit.UIColor {
        return UIKit.UIColor(CGColor: self)
    }
}