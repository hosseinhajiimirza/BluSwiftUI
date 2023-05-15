//
//  Network.swift
//  BluSwiftUI
//
//  Created by Hossein Hajimirza on 5/15/23.
//

import SwiftUI

struct Network<Content>: View where Content: View {
    @StateObject public var networkViewModel: NetworkViewModel = .init()
    
    private let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        // We can add some general statements based on NetworkViewModel
        ZStack {
            content
                .environmentObject(networkViewModel)
        }
    }
}
