//
//  CardListObject.swift
//  SafeBoda
//
//  Created by Achem Samuel on 6/23/20.
//  Copyright © 2020 Achem Samuel. All rights reserved.
//

import Foundation

struct CardListObject: Codable {
    var data: [CardList]?
    var object: String?
    var totalCards: Int?
    var hasMore: Bool?
    
    enum CodingKeys: String, CodingKey {
        case object
        case totalCards = "total_cards"
        case hasMore = "has_more"
        case data
    }
}

struct CardList: Codable {
    var object: String?
    var id: String?
    var oracleID: String?
    var multiverseIDS: [Int]?
    var mtgoID: Int?
    var mtgoFoilID: Int?
    var tcgplayerID: Int?
    var name: String?
    var lang: String?
    var releasedAt: String?
    var uri: String?
    var scryfallURI: String?
    var layout: String?
    var highresImage: Bool?
    var imageUris: ImageUris?
    var manaCost: String?
    var cmc: Int?
    var typeLine: String?
    var oracleText: String?
    var power: String?
    var toughness: String?
    var colors: [String]?
    var colorIdentity: [String]?
    var keywords: [String]?
    var legalities: Legalities?
    var games: [String]?
    var reserved: Bool?
    var foil: Bool?
    var nonfoil: Bool?
    var oversized: Bool?
    var promo: Bool?
    var reprint: Bool?
    var variation: Bool?
    var datumSet: String?
    var setName: String?
    var setType: String?
    var setURI: String?
    var setSearchURI: String?
    var scryfallSetURI: String?
    var rulingsURI: String?
    var printsSearchURI: String?
    var collectorNumber: String?
    var digital: Bool?
    var rarity: String?
    var cardBackID: String?
    var artist: String?
    var artistIDS: [String]?
    var illustrationID: String?
    var borderColor: String?
    var frame: String?
    var fullArt: Bool?
    var textless: Bool?
    var booster: Bool?
    var storySpotlight: Bool?
    var edhrecRank: Int?
    
    enum CodingKeys: String, CodingKey {
        case object
        case id
        case oracleID = "oracle_id"
        case multiverseIDS = "multiverse_ids"
        case mtgoID = "mtgo_id"
        case mtgoFoilID = "mtgo_foil_id"
        case tcgplayerID = "tcgplayer_id"
        case name, lang
        case releasedAt = "released_at"
        case uri
        case scryfallURI = "scryfall_uri"
        case layout
        case highresImage = "highres_image"
        case imageUris = "image_uris"
        case manaCost = "mana_cost"
        case cmc
        case typeLine = "type_line"
        case oracleText = "oracle_text"
        case power, toughness, colors
        case colorIdentity = "color_identity"
        case keywords
        case legalities
        case games
        case reserved
        case foil
        case nonfoil
        case oversized
        case promo
        case reprint
        case variation
        case datumSet = "set"
        case setName = "set_name"
        case setType = "set_type"
        case setURI = "set_uri"
        case setSearchURI = "set_search_uri"
        case scryfallSetURI = "scryfall_set_uri"
        case rulingsURI = "rulings_uri"
        case printsSearchURI = "prints_search_uri"
        case collectorNumber = "collector_number"
        case digital, rarity
        case cardBackID = "card_back_id"
        case artist
        case artistIDS = "artist_ids"
        case illustrationID = "illustration_id"
        case borderColor = "border_color"
        case frame
        case fullArt = "full_art"
        case textless, booster
        case storySpotlight = "story_spotlight"
        case edhrecRank = "edhrec_rank"
    }
}

struct CardListViewModel {
    var id: String = ""
    var name: String = ""
    var image = ImageUrisViewModel()
    var setName: String = ""
    var cardType: String = ""
    var rarity: String = ""
    var releaseDate: String = ""
    var manaCost: String = ""
    var cmc: Int = 0
    var oracleText: String = ""
    var legalities = LegalitiesViewModel()
}

extension CardList {
    func toViewModel() -> CardListViewModel {
        var viewModel = CardListViewModel()
        viewModel.id = id ?? ""
        viewModel.cardType = typeLine ?? "N/A"
        viewModel.name = name ?? "N/A"
        viewModel.image = imageUris?.toViewModel() ?? ImageUrisViewModel()
        viewModel.setName = setName ?? "N/A"
        viewModel.rarity = rarity ?? "N/A"
        viewModel.releaseDate = releasedAt ?? "N/A"
        viewModel.manaCost = manaCost ?? "N/A"
        viewModel.cmc = cmc ?? 0
        viewModel.oracleText = oracleText ?? "N/A"
        viewModel.legalities = legalities?.toViewModel() ?? LegalitiesViewModel()
        
        return viewModel
    }
}
