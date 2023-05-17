//
//  HomeTransferRow.swift
//  BluSwiftUI
//
//  Created by Hossein Hajimirza on 5/15/23.
//

import SwiftUI

struct HomeTransferRow: View {
    let homeModel: HomeModel
    let favoriteButtonSFSymbol: String
    var action: (() -> Void)?
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        HStack(alignment: .center) {
            HomeTransferRowAvatar(url: homeModel.person.avatar)
                .frame(width: 64, height: 64)
            VStack(alignment: .leading, spacing: 12) {
                Text(homeModel.person.fullName.capitalized)
                    .font(.body)
                    .fontWeight(.medium)
                Text(homeModel.person.email)
                    .font(.callout)
                    .foregroundColor(.gray)
            }
            Spacer(minLength: 12)
            HStack(alignment: .center) {
                Button {
                    action?()
                } label: {
                    Image(systemName: favoriteButtonSFSymbol)
                        .imageScale(.large)
                        .foregroundColor(.yellow)
                }
                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
            }
        }
        .foregroundColor(
            colorScheme == .light ? .black : .white
        )
        .padding(.vertical, 12)
        .padding(.horizontal)
        .lineLimit(1)
    }
}

struct HomeTransferRow_Previews: PreviewProvider {
    static var previews: some View {
        HomeTransferRow(homeModel: .init(), favoriteButtonSFSymbol: "star")
    }
}
