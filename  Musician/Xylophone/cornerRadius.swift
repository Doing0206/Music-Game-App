//
//  UIView+O2CornerRadius.swift
//  DongDongLaboratory
//
//  Created by Doing on 2018/12/28.
//  Copyright © 2018 Doing. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        // also  set(newValue)
        set {
            layer.cornerRadius = newValue
        }
    }
}
