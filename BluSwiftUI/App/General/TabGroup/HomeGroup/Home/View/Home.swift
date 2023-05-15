//
//  Home.swift
//  BluSwiftUI
//
//  Created by Hossein Hajimirza on 5/15/23.
//

import SwiftUI

struct Home: View {
    @StateObject private var homeViewModel: HomeViewModel
    
    init(homeAPIProtocol: HomeAPIProtocol = HomeAPI()) {
        self._homeViewModel = StateObject(wrappedValue: HomeViewModel(homeAPIProtocol: homeAPIProtocol))
    }
    
    var body: some View {
        Text("Hello, World!")
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
