//
//  UIViewController+Extension.swift
//  Yummie
//
//  Created by Yusuf Mert Yıldız on 2.05.2023.
//

import UIKit

extension UIViewController {
    
    static var identifier : String {
        return String(describing:self)
    }
    static func instantiate () -> Self {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        return storyboard.instantiateViewController(withIdentifier: identifier) as! Self
    }
    
    
}
