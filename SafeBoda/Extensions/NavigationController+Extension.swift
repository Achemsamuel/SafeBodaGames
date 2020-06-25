//
//  NavigationController+Extension.swift
//  SafeBoda
//
//  Created by Achem Samuel on 6/24/20.
//  Copyright © 2020 Achem Samuel. All rights reserved.
//

import UIKit

extension UINavigationController {
    
    func makeNavBarTransparent() {
        self.navigationBar.isHidden = false
        self.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.isTranslucent = true
        self.view.backgroundColor = .clear
        self.navigationBar.tintColor = UIColor.white
    }
}
