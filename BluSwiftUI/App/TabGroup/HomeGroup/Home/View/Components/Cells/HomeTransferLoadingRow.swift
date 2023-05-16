//
//  HomeTransferLoadingRow.swift
//  BluSwiftUI
//
//  Created by Hossein Hajimirza on 5/17/23.
//

import SwiftUI

struct HomeTransferLoadingRow: View {
    var body: some View {
        HStack(alignment: .center) {
            Circle()
                .fill(Color.gray.opacity(0.5))
                .frame(width: 64, height: 64)
            VStack(alignment: .leading, spacing: 12) {
                Text("Hossein Haji")
                    .font(.body)
                    .fontWeight(.medium)
                Text("email@email")
                    .font(.callout)
                    .foregroundColor(.gray)
            }
            Spacer(minLength: 12)
            HStack(alignment: .center) {
                Image(systemName: "star")
                    .imageScale(.large)
                    .foregroundColor(.gray)
                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
            }
        }
        .padding(.vertical, 12)
        .padding(.horizontal)
        .lineLimit(1)
        .shimmerEffect()
    }
}

struct HomeTransferLoadingRow_Previews: PreviewProvider {
    static var previews: some View {
        HomeTransferLoadingRow()
    }
}
