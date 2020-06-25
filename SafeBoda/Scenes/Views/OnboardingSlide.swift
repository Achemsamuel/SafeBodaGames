//
//  OnboardingSlide.swift
//  SafeBoda
//
//  Created by Achem Samuel on 6/23/20.
//  Copyright © 2020 Achem Samuel. All rights reserved.
//

import UIKit

class OnboardingSlide: UIView {

    static let NIB_NAME = String(describing: OnboardingSlide.self)
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var wrappingView: UIView!
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var titleAndMessageView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initSubviews()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initSubviews()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        initSubviews()
    }
    
    private func initSubviews(){
        loadFromNib()
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
    private func loadFromNib(){
            Bundle.main.loadNibNamed(OnboardingSlide.NIB_NAME, owner: self, options: nil)
            addSubview(contentView)
    }
    
    static func createSlide(_ image: UIImage?, title: String, desc: String?)->OnboardingSlide{
        let slide = OnboardingSlide()
        slide.mainImageView.image = image
        slide.titleLabel.text = title
        slide.messageLabel.text = desc
        return slide
    }
}
