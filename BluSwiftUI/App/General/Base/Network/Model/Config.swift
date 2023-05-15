//
//  Config.swift
//  BluSwiftUI
//
//  Created by Hossein Hajimirza on 5/15/23.
//

import Foundation

enum Method: String{
    case post = "POST"
    case get = "GET"
    case patch = "PATCH"
    case delete = "DELETE"
}

enum AppConfig: String {
    case baseURL = "https://jsonplaceholder.typicode.com/"
}
