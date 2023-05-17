//
//  BluCard.swift
//  BluSwiftUI
//
//  Created by Hossein Hajimirza on 5/16/23.
//

import SwiftUI

struct BluCard: View {
    let homeModel: HomeModel
    @State private var contentSize = CGSize.zero
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)) {
            ZStack {
                Color.white
                LinearGradient(colors: [.blue.opacity(0.5), .blue.opacity(0.3)], startPoint: .topLeading, endPoint: .bottomTrailing)
            }
            .cornerRadius(12)
            .shadow(color:  colorScheme == .light ? .clear : .white.opacity(0.5), radius: 2)
            HStack(alignment: .center) {
                HStack(alignment: .top, spacing: 8) {
                    Text("blubank.com")
                        .fixedSize()
                        .font(.caption2)
                        .readSize(onChange: { size in
                            contentSize = size
                        })
                        .rotationEffect(.degrees(-90))
                        .frame(width: contentSize.height, height: contentSize.width)
                        .padding(.leading, 8)
                        .padding(.top, 12)
                    Rectangle()
                        .fill(Color.black)
                        .frame(width: 44)
                }
                VStack(alignment: .leading) {
                    Spacer(minLength: 0)
                    Text(homeModel.person.fullName.toCardNameFormat)
                        .font(.title3)
                        .lineLimit(3)
                    Spacer(minLength: 0)
                    Text(homeModel.card.cardNumber.toCardNumberFormat)
                        .font(.title3)
                        .fontWeight(.medium)
                    Spacer(minLength: 0)
                    VStack(alignment: .leading) {
                        Text("Type")
                            .font(.caption)
                        Text(homeModel.card.cardType)
                            .font(.caption)
                    }
                }
                .padding(.vertical)
            }
        }
        .foregroundColor(.black)
        .frame(width: 220, height: 300)
    }
}

struct BluCard_Previews: PreviewProvider {
    static var previews: some View {
        BluCard(homeModel: .init())
            .preferredColorScheme(.dark)
    }
}
