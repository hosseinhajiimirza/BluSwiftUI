//
//  HomeTransferRow.swift
//  BluSwiftUI
//
//  Created by Hossein Hajimirza on 5/15/23.
//

import SwiftUI

struct HomeTransferRow: View {
    let homeModel: HomeModel
    
    var body: some View {
        HStack {
            CashedImage(url: homeModel.person.avatar) { phase in
                switch phase {
                case .empty:
                    ZStack {
                        Circle()
                            .fill(Color.gray)
                        ProgressView()
                    }
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFit()
                case .failure(_):
                    Circle()
                        .fill(Color.red)
                }
            }
            .clipShape(Circle())
            VStack(alignment: .leading) {
                Text(homeModel.person.fullName.capitalized)
                    .font(.body)
                    .fontWeight(.medium)
                Spacer(minLength: 0)
                Text(homeModel.person.email)
                    .font(.callout)
                    .foregroundColor(.gray)
            }
            Spacer(minLength: 12)
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
        .padding(.vertical, 12)
        .padding(.horizontal)
        .frame(height: 82)
    }
}

struct HomeTransferRow_Previews: PreviewProvider {
    static var previews: some View {
        HomeTransferRow(homeModel: .init())
    }
}
