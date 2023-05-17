//
//  SimpleRow.swift
//  BluSwiftUI
//
//  Created by Hossein Hajimirza on 5/16/23.
//

import SwiftUI

struct SimpleRow: View {
    let leadingText: String
    let trailingText: String
    
    var body: some View {
        HStack(spacing: 4) {
            Text("\(leadingText):")
            Spacer(minLength: 8)
            Text(trailingText)
        }
        .font(.callout)
        .lineLimit(1)
    }
}

struct SimpleRow_Previews: PreviewProvider {
    static var previews: some View {
        SimpleRow(leadingText: "He", trailingText: "Ho")
    }
}
