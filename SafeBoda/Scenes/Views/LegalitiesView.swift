//
//  LegalitiesView.swift
//  SafeBoda
//
//  Created by Achem Samuel on 6/23/20.
//  Copyright © 2020 Achem Samuel. All rights reserved.
//
import UIKit


class LegalitiesView: UIView {
    
    @IBOutlet var legalitiesView: UIView!
    @IBOutlet weak var legalText: UILabel!
    @IBOutlet weak var name: UILabel!
    
    override init(frame: CGRect) {
           super.init(frame: frame)
           commonInit()
       }
       
       required init?(coder aDecoder: NSCoder) {
           super.init(coder: aDecoder)
           commonInit()
       }
       
       private func commonInit() {
           Bundle.main.loadNibNamed("LegalitiesView", owner: self, options: nil)
           addSubview(legalitiesView)
           legalitiesView.frame = self.bounds
           legalitiesView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
       }
    
    func configureView() {
        
    }
}

