//
//  SearchInteractor.swift
//  SafeBoda
//
//  Created by Achem Samuel on 6/23/20.
//  Copyright (c) 2020 Achem Samuel. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol SearchBusinessLogic
{
    func searchCards(request: Search.Search.Request)
    func processCardTap(request: Search.ProcessCardTap.Request)
}

protocol SearchDataStore
{
    var selectedCard: CardList? {get set}
    var cardList: [CardList] {get set}
}

final class SearchInteractor: SearchBusinessLogic, SearchDataStore
{
    var presenter: SearchPresentationLogic?
    var selectedCard: CardList?
    var cardList: [CardList] = []
    
    func searchCards(request: Search.Search.Request) {
        let apiClient = ApiClient()
        let params: [String:Any] = ["q": request.query, "size": 10]
        let urlSuffix = request.query.replacingOccurrences(of: " ", with: "+")
        presenter?.presentLoader()
        apiClient.get(urlSuffix: urlSuffix, params: params) { [weak self] result in
            switch result {
            case .success(let data):
                do {
                    let cardListObject = try JSONDecoder().decode(CardListObject.self, from: data)
                    print(cardListObject)
                    self?.cardList = cardListObject.data ?? []
                    self?.presenter?.presentCards(response: Search.Search.Response(cards: self?.cardList ?? []))
                } catch {
                     print(error.localizedDescription)
                }
            case .failure(let error):
                self?.presenter?.presentError(response: Search.ResponseError.Response(error: error))
                print(error.localizedDescription)
            }
        }
    }
    
    func processCardTap(request: Search.ProcessCardTap.Request) {
        self.selectedCard = cardList.filter({$0.id == request.id}).first
    }
}
