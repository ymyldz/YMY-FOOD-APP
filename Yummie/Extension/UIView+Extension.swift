//
//  UIView+Extension.swift
//  Yummie
//
//  Created by Yusuf Mert Yıldız on 28.04.2023.
//

import UIKit

extension UIView {
    
    @IBInspectable var cornerRadius : CGFloat {
         get {return cornerRadius}
        set {
            self.layer.cornerRadius = newValue
        }
    }
}
 
