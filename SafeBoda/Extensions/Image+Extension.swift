//
//  Image+Extension.swift
//  SafeBoda
//
//  Created by Achem Samuel on 6/24/20.
//  Copyright © 2020 Achem Samuel. All rights reserved.
//

import UIKit

extension UIImage {
    static let shared = UIImage()
    static func defaultCardImage() -> UIImage? {
        return #imageLiteral(resourceName: "appIconImage")
    }
    
    static var navigatonCloseItemIcon: UIImage? {
        return UIImage(named: "nav_Close_Icon")
    }
    
    static var searchIcon: UIImage? {
           return UIImage(named: "searchIcon")
       }
    
    static var posterEmptyState: UIImage? {
        return UIImage(named: "posterEmptyState")
    }
    
    static var manEmptyState: UIImage? {
        return UIImage(named: "manEmptyState")
    }
}
