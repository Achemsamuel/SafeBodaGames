//
//  CDAlertHelper.swift
//  SafeBoda
//
//  Created by Achem Samuel on 6/23/20.
//  Copyright © 2020 Achem Samuel. All rights reserved.
//

import Foundation
import UIKit
import CDAlertView
import BRYXBanner

class CDAlertHelper {
    
    class func showBanner(title: String, message: String, success:Bool){
        if success{
        let banner = Banner(title: title, subtitle: message, image: UIImage(named: "Icon"), backgroundColor: UIColor(red:48.00/255.0, green:174.0/255.0, blue:51.5/255.0, alpha: 0.5))
            banner.dismissesOnTap = true
            banner.position = currentPosition()
            banner.show(duration: 4.0)
        }else{
        let banner = Banner(title: title, subtitle: message, image: UIImage(named: "Icon"), backgroundColor: UIColor.red)
            banner.dismissesOnTap = true
            banner.position = currentPosition()
            banner.show(duration: 4.0)
        }
    }
    
    class func showLongTextBanner(title: String, message: String, success:Bool){
        if success{
        let banner = Banner(title: title, subtitle: message, image: UIImage(named: "Icon"), backgroundColor: UIColor(red:48.00/255.0, green:174.0/255.0, blue:51.5/255.0, alpha: 0.5))
            banner.dismissesOnTap = true
            banner.position = currentPosition()
            banner.show(duration: 4.0)
        }else{
        let banner = Banner(title: title, subtitle: message, image: UIImage(named: "Icon"), backgroundColor: UIColor.red)
            banner.dismissesOnTap = true
            banner.position = currentPosition()
            banner.show(duration: 4.0)
        }
    }
    
    class func showQuickBanner(title: String, message: String, success:Bool){
           if success{
           let banner = Banner(title: title, subtitle: message, image: UIImage(named: "Icon"), backgroundColor: UIColor(red:48.00/255.0, green:174.0/255.0, blue:51.5/255.0, alpha: 0.5))
               banner.dismissesOnTap = true
               banner.position = currentPosition()
            banner.show(duration: 0.2)
           }else{
           let banner = Banner(title: title, subtitle: message, image: UIImage(named: "Icon"), backgroundColor: UIColor.red)
               banner.dismissesOnTap = true
               banner.position = currentPosition()
               banner.show(duration: 0.1)
           }
       }
    
    class func showDarkGreenBanner(title: String, message: String, success:Bool){
        if success{
            let banner = Banner(title: title, subtitle: message, image: UIImage(named: "Icon"), backgroundColor: UIColor(red: 0.13, green:0.8, blue:0.4, alpha: 0.66))
            banner.dismissesOnTap = true
            banner.position = currentPosition()
            banner.show(duration: 3.0)
        }else{
        let banner = Banner(title: title, subtitle: message, image: UIImage(named: "Icon"), backgroundColor: UIColor.red)
            banner.dismissesOnTap = true
            banner.position = currentPosition()
            banner.show(duration: 2.0)
        }
    }
    
    class func currentPosition() -> BannerPosition {
    return .top
    }
    
}
