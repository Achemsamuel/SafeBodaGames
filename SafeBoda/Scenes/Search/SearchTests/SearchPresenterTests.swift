//
//  SearchPresenterTests.swift
//  SafeBoda
//
//  Created by Achem Samuel on 6/23/20.
//  Copyright (c) 2020 Achem Samuel. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

@testable import SafeBoda
import XCTest

class SearchPresenterTests: XCTestCase
{
  // MARK: Subject under test
  
  var sut: SearchPresenter!
  
  // MARK: Test lifecycle
  
  override func setUp()
  {
    super.setUp()
    setupSearchPresenter()
  }
  
  override func tearDown()
  {
    super.tearDown()
  }
  
  // MARK: Test setup
  
  func setupSearchPresenter()
  {
    sut = SearchPresenter()
  }
  
  // MARK: Test doubles
  
  class SearchDisplayLogicSpy: SearchDisplayLogic
  {
    var displayErrorWasCalled = false
    func displayError(viewModel: Search.ResponseError.ViewModel) {
        displayErrorWasCalled = true
    }
    
    var displayCardsWasCalled = false
    func displayCards(viewModel: Search.Search.ViewModel) {
        displayCardsWasCalled = true
    }
    
    var displayLoaderWasCalled = false
    func displayLoader() {
        displayLoaderWasCalled = true
    }
    
    
  }
  
  // MARK: Tests
  
  func testPresentCard()
  {
    let spy = SearchDisplayLogicSpy()
    sut.viewController = spy
    let response = Search.Search.Response(cards: [])
    sut.presentCards(response: response)
    XCTAssertTrue(spy.displayCardsWasCalled, "presentCards(response: ) should ask the view controller to display the result")
  }
    
    func testPresentLoader() {
        let spy = SearchDisplayLogicSpy()
        sut.viewController = spy
        sut.presentLoader()
          XCTAssertTrue(spy.displayLoaderWasCalled, "presentLoader() should ask the view controller to display the loader")
    }
}