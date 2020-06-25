//
//  Legalities.swift
//  SafeBoda
//
//  Created by Achem Samuel on 6/23/20.
//  Copyright © 2020 Achem Samuel. All rights reserved.
//

import Foundation

struct Legalities: Codable {
    var standard: String?
    var future: String?
    var historic: String?
    var pioneer: String?
    var modern: String?
    var legacy: String?
    var pauper: String?
    var vintage: String?
    var penny: String?
    var commander: String?
    var brawl: String?
    var duel: String?
    var oldschool: String?
}

struct LegalitiesViewModel {
    var standard: String = ""
    var future: String = ""
    var historic: String = ""
    var pioneer: String = ""
    var modern: String = ""
    var legacy: String = ""
    var pauper: String = ""
    var vintage: String = ""
    var penny: String = ""
    var commander: String = ""
    var brawl: String = ""
    var duel: String = ""
    var oldschool: String = ""
}

extension Legalities {
    func toViewModel() -> LegalitiesViewModel {
        var viewModel = LegalitiesViewModel()
        viewModel.standard = standard?.retunLegalOrNot() ?? ""
        viewModel.future = future?.retunLegalOrNot() ?? ""
        viewModel.historic = historic?.retunLegalOrNot() ?? ""
        viewModel.pioneer = pioneer?.retunLegalOrNot() ?? ""
        viewModel.modern = modern?.retunLegalOrNot() ?? ""
        viewModel.legacy = legacy?.retunLegalOrNot() ?? ""
        viewModel.pauper = pauper?.retunLegalOrNot() ?? ""
        viewModel.vintage = vintage?.retunLegalOrNot() ?? ""
        viewModel.penny = penny?.retunLegalOrNot() ?? ""
        viewModel.commander = commander?.retunLegalOrNot() ?? ""
        viewModel.brawl = brawl?.retunLegalOrNot() ?? ""
        viewModel.duel = duel?.retunLegalOrNot() ?? ""
        viewModel.oldschool = oldschool?.retunLegalOrNot() ?? ""
        
        return viewModel
    }
}

enum LegalityCheck: String {
  case legal = "legal"
  case nonLegal = "not_legal"
  
}
