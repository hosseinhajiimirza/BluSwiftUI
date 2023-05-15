//
//  HomeAPIProtocol.swift
//  BluSwiftUI
//
//  Created by Hossein Hajimirza on 5/15/23.
//

import Foundation

protocol HomeAPIProtocol {
    func getTransferList(page: Int) async throws -> HomeResponseModel?
}
