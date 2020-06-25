//
//  ImageUris.swift
//  SafeBoda
//
//  Created by Achem Samuel on 6/23/20.
//  Copyright © 2020 Achem Samuel. All rights reserved.
//

import Foundation

struct ImageUris: Codable {
    var small: String?
    var normal: String?
    var large: String?
    var png: String?
    var artCrop, borderCrop: String?
    
    enum CodingKeys: String, CodingKey {
        case small, normal, large, png
        case artCrop = "art_crop"
        case borderCrop = "border_crop"
    }
}

struct ImageUrisViewModel {
    var small: String = ""
    var normal: String = ""
    var large: String = ""
    var png: String = ""
    var artCrop: String = ""
    var borderCrop: String = ""
}

extension ImageUris {
    func toViewModel() -> ImageUrisViewModel {
        var viewModel = ImageUrisViewModel()
        viewModel.small = small ?? ""
        viewModel.normal = normal ?? ""
        viewModel.large = large ?? ""
        viewModel.png = png ?? ""
        viewModel.borderCrop = borderCrop ?? ""
        viewModel.artCrop = artCrop ?? ""
        
        return viewModel
    }
}
