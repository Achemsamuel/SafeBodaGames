//
//  Color+Extension.swift
//  SafeBoda
//
//  Created by Achem Samuel on 6/23/20.
//  Copyright © 2020 Achem Samuel. All rights reserved.
//

import UIKit

extension UIColor {
    static func searchBarGreyBackground() -> UIColor {
        return UIColor(named: "DiscoverSearchBarColor") ?? UIColor.systemGray
    }
    
    static func greyBackground() -> UIColor {
        return UIColor(named: "Koya-Grey-Background") ?? UIColor.systemGray
    }
    
    static func navBarTint() -> UIColor {
        if #available(iOS 13.0, *) {
            return UIColor(named: "KoyaNavBar") ?? UIColor.black
        } else {
            return UIColor.black
        }
        
    }
}
