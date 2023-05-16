//
//  DetailsPageAvatar.swift
//  BluSwiftUI
//
//  Created by Hossein Hajimirza on 5/16/23.
//

import SwiftUI

struct DetailsPageAvatar: View {
    let url: String
    
    var body: some View {
        CashedImage(url: url) { phase in
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
                ZStack {
                    Circle()
                        .fill(Color.gray)
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                        .padding(24)
                }
            }
        }
        .clipShape(Circle())
        .frame(width: 124, height: 124)
    }
}

struct DetailsPageAvatar_Previews: PreviewProvider {
    static var previews: some View {
        DetailsPageAvatar(url: "")
    }
}
