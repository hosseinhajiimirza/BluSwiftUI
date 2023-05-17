//
//  HeadingTitle.swift
//  BluSwiftUI
//
//  Created by Hossein Hajimirza on 5/16/23.
//

import SwiftUI

struct HeadingTitle: View {
    let title: String
    
    var body: some View {
        Text(title)
            .font(.title2)
            .fontWeight(.medium)
    }
}

struct HeadingTitle_Previews: PreviewProvider {
    static var previews: some View {
        HeadingTitle(title: "All")
    }
}
