//
//  SearchBar+Extension.swift
//  SafeBoda
//
//  Created by Achem Samuel on 6/23/20.
//  Copyright © 2020 Achem Samuel. All rights reserved.
//

import UIKit

extension UISearchBar {
    func discoverGreySearchBar(_ searchBar : UISearchBar? = nil) {
            self.searchTextField.backgroundColor = UIColor.searchBarGreyBackground()
            if #available(iOS 13.0, *) {
                self.searchTextField.textColor = .label
                self.searchTextField.tintColor = .label
                if traitCollection.userInterfaceStyle == .dark {
                    self.backgroundImage = nil
                }
            } else {
                // Fallback on earlier versions
                self.searchTextField.textColor = .black
            }
      }
}
