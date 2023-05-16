//
//  TransferInfo.swift
//  BluSwiftUI
//
//  Created by Hossein Hajimirza on 5/16/23.
//

import SwiftUI

struct TransferInfo: View {
    var body: some View {
        VStack {
            SimpleRow(leadingText: "Last transfer", trailingText: "2022-08-31T15:24:16Z")
            Divider()
            SimpleRow(leadingText: "Number of transfers", trailingText: "22343")
            Divider()
            SimpleRow(leadingText: "Total transfers", trailingText: "222343")
            Divider()
            VStack(alignment: .leading, spacing: 12) {
                HStack {
                    Text("Note:")
                        .font(.callout)
                    Spacer()
                }
                Text("dfjafa sdjasl faslfjd fsajlkjfa wefhe afdksajfaeiejealfjalsfjasdae fej aelfjaeldja slfjaeife ajljlkjljljljljljljlkjklj jljlj  kjlkljljlkjlkj jljljjjjjjj")
            }
        }
        .padding()
        .background(Color.gray.opacity(0.2))
        .cornerRadius(12)
    }
}

struct TransferInfo_Previews: PreviewProvider {
    static var previews: some View {
        TransferInfo()
    }
}
