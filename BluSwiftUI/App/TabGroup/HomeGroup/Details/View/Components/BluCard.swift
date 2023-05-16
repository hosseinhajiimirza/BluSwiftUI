//
//  BluCard.swift
//  BluSwiftUI
//
//  Created by Hossein Hajimirza on 5/16/23.
//

import SwiftUI

struct BluCard: View {

    /*
     name, email, avatar
     card: number, type
     transfer: date, numberOf, total
     */
    @State private var contentSize = CGSize.zero
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)) {
            RoundedRectangle(cornerRadius: 12)
                .fill(
                    LinearGradient(colors: [.yellow, .gray], startPoint: .topLeading, endPoint: .bottomTrailing)
                )
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
                        .frame(width: 44)
                }
                VStack(alignment: .leading) {
                    Spacer(minLength: 0)
                    Text("Jemimah Sprott".toCardNameFormat)
                        .font(.title3)
                        .lineLimit(3)
                    Spacer(minLength: 0)
                    Text("6219145011234114".toCardNumberFormat)
                        .font(.title3)
                        .fontWeight(.medium)
                    Spacer(minLength: 0)
                    VStack(alignment: .leading) {
                        Text("Type")
                            .font(.caption)
                        Text("Mastercard")
                            .font(.caption)
                    }
                }
                .padding(.vertical)
            }
        }
        .frame(width: 220, height: 300)
    }

}

struct BluCard_Previews: PreviewProvider {
    static var previews: some View {
        BluCard()
    }
}
