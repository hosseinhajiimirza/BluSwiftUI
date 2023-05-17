//
//  HomeUnitTest.swift
//  BluSwiftUI_UnitTests
//
//  Created by Hossein Hajimirza on 5/17/23.
//

import XCTest
@testable import BluSwiftUI

@MainActor
final class HomeUnitTest: XCTestCase {
    let expectation = XCTestExpectation(description: #function)
    var viewModel: HomeViewModel?
    var homeMockAPI: HomeMockAPI?

    override func setUpWithError() throws {
        homeMockAPI = .init()
        viewModel = .init(homeAPIProtocol: homeMockAPI!)
    }

    override func tearDownWithError() throws {
        viewModel = nil
        homeMockAPI = nil
    }

    func test_viewModel_getAllPosts_shouldDecodeModel() {
        // Given
        homeMockAPI?.mockNetworkViewModel.shouldReturnError = false
        // When
        Task {
            await viewModel?.getTransferList()
            // Then
            XCTAssertNotEqual(viewModel?.transfers.count, 0)
            self.expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5.0)
    }
    // Or:
    func test_getAllPosts_shouldDecodeModel() {
        // Given
        homeMockAPI?.mockNetworkViewModel.shouldReturnError = false
        // When
        Task {
            if let model = try? await homeMockAPI?.getTransferList() {
                // Then
                XCTAssertNotNil(model)
                XCTAssertNotEqual(model.count, 0)
                self.expectation.fulfill()
            }
        }
        
        wait(for: [expectation], timeout: 5.0)
    }
}
