//
//  CardDetailModels.swift
//  SafeBoda
//
//  Created by Achem Samuel on 6/24/20.
//  Copyright (c) 2020 Achem Samuel. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

enum CardDetail
{
    struct ViewModel {
        var cardVM = CardListViewModel()
    }
  
    enum FetchDataOnLoad {
        struct Response {
            var card: CardList?
        }
        
        struct ViewModel {
            var cardVM = CardListViewModel()
        }
    }
  
 
    enum CardDetailList: String {
        case type = "Type: "
        case setName = "Set Name: "
        case rarity = "Rarity: "
        case release = "Released: "
        case manaCost = "Mana Cost: "
        case cmc = "CMC: "
        case oracle = "Oracle: "
    }
    
    enum Legalities: String {
        case standard = "Standard: "
        case oldSchool = "Old School: "
        case duel = "Duel: "
        case brawl = "Brawl: "
        case commander = "Commander: "
        case penny = "Penny: "
        case vintage = "Vintage: "
        case pauper = "Pauper: "
        case legacy = "Legacy: "
        case modern = "Modern: "
        case pioneer = "Pioneer: "
        case historic = "Historic: "
        case future = "Future: "
    }
}