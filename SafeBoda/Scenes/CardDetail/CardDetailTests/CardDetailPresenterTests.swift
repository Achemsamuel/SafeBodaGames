//
//  CardDetailPresenterTests.swift
//  SafeBoda
//
//  Created by Achem Samuel on 6/24/20.
//  Copyright (c) 2020 Achem Samuel. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

@testable import SafeBoda
import XCTest

class CardDetailPresenterTests: XCTestCase
{
  // MARK: Subject under test
  
  var sut: CardDetailPresenter!
  
  // MARK: Test lifecycle
  
  override func setUp()
  {
    super.setUp()
    setupCardDetailPresenter()
  }
  
  override func tearDown()
  {
    super.tearDown()
  }
  
  // MARK: Test setup
  
  func setupCardDetailPresenter()
  {
    sut = CardDetailPresenter()
  }
  
  // MARK: Test doubles
  
  class CardDetailDisplayLogicSpy: CardDetailDisplayLogic
  {
    var displayDataOnLoadWasCalled = false
    func displayDataOnLoad(viewModel: CardDetail.FetchDataOnLoad.ViewModel) {
        displayDataOnLoadWasCalled = true
    }
  }
  
  // MARK: Tests
  
  func testPresentDataOnLoad()
  {
    let spy = CardDetailDisplayLogicSpy()
    sut.viewController = spy
    let response = CardDetail.FetchDataOnLoad.Response()
    sut.presentDataOnLoad(response: response)
    XCTAssertTrue(spy.displayDataOnLoadWasCalled, "presentDataOnLoad(response:) should ask the view controller to display the result")
  }
}
