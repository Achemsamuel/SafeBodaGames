//
//  ContentListTableViewCell.swift
//  SafeBoda
//
//  Created by Achem Samuel on 6/23/20.
//  Copyright © 2020 Achem Samuel. All rights reserved.
//

import UIKit
import Kingfisher

protocol CellTappedDelegate: class {
    func didTapCell(indexPath: IndexPath, cardId: String)
}

class ContentListTableViewCell: UITableViewCell {

    static let NIB_NAME = "ContentListTableViewCell"
    static let Identifier = "ContentListTableViewCell"
    static let estimatedHeight = CGFloat(350)
    
    
    @IBOutlet weak var contentImage: UIImageView!
    @IBOutlet weak private var cardName: UILabel!
    @IBOutlet weak private var setName: UILabel!
    @IBOutlet weak private var cardType: UILabel!
    @IBOutlet weak private var rarity: UILabel!
    @IBOutlet weak private var innerContentView: UIView!
    
    
    var isContentSaved: Bool = false
    var indexPath = IndexPath()
    weak var delegate: CellTappedDelegate?
    var viewModel = CardListViewModel()
    var shadowLayer = CAShapeLayer()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 6.0
        innerContentView.layer.cornerRadius = 6.0
        innerContentView.layer.shadowColor = UIColor.darkGray.cgColor
    }

    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(roundedRect: self.innerContentView.bounds, byRoundingCorners: [.bottomRight, .bottomLeft, .topLeft, .topRight], cornerRadii: CGSize(width: 10, height: 10))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.innerContentView.layer.mask = mask
        // Handle Cell reuse case
        shadowLayer.removeFromSuperlayer()

        shadowLayer.shadowPath = path.cgPath
        shadowLayer.frame = self.innerContentView.layer.frame
        print(shadowLayer.frame)
        shadowLayer.shadowOffset = CGSize(width: 0, height: 0)
        shadowLayer.shadowColor = UIColor.darkGray.cgColor
        shadowLayer.shadowOpacity = 0.9
        self.contentView.layer.insertSublayer(shadowLayer, below: self.innerContentView.layer)
        super.draw(rect)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func configureView(viewModel: CardListViewModel) {
        self.viewModel = viewModel
        contentImage.kf.setImage(with: URL(string: self.viewModel.image.artCrop), placeholder: UIImage.defaultCardImage(), options: [.transition(.fade(1.0)), .progressiveJPEG(.default)])
        cardName.text = viewModel.name
        setName.text = viewModel.setName
        cardType.text = viewModel.cardType
        rarity.text = viewModel.rarity
    }
    
    @IBAction func didTapCell(_ sender: UIButton) {
        print("cell tapped")
        delegate?.didTapCell(indexPath: self.indexPath, cardId: viewModel.id)
    }
    
}
