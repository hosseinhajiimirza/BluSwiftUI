//
//  TransferInfo.swift
//  BluSwiftUI
//
//  Created by Hossein Hajimirza on 5/16/23.
//

import SwiftUI

struct TransferInfo: View {
    let homeModel: HomeModel
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack {
            SimpleRow(leadingText: "Last transfer", trailingText: homeModel.lastTransfer.toISODate.toCustomFormatSTR)
            Divider()
            SimpleRow(leadingText: "Number of transfers", trailingText: homeModel.moreInfo.numberOfTransfers.toString)
            Divider()
            SimpleRow(leadingText: "Total transfers", trailingText: homeModel.moreInfo.totalTransfer.toString)
            if !homeModel.note.isEmpty {
                Divider()
                VStack(alignment: .leading, spacing: 12) {
                    HStack {
                        Text("Note:")
                        Spacer()
                    }
                    Text(homeModel.note)
                }
                .font(.callout)
            }
        }
        .padding()
        .background(
            Color.gray.opacity(colorScheme == .light ? 0.1 : 0.2)
        )
        .cornerRadius(12)
    }
}

struct TransferInfo_Previews: PreviewProvider {
    static var previews: some View {
        TransferInfo(homeModel: .init())
            .preferredColorScheme(.dark)
    }
}
