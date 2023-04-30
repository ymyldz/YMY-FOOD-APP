//
//  String+Extension.swift
//  Yummie
//
//  Created by Yusuf Mert Yıldız on 1.05.2023.
//

import Foundation


extension String {
    var asUrl : URL? {
        return URL(string: self)
    }
}
