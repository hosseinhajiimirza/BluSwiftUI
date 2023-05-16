//
//  HomeTransferRowAvatar.swift
//  BluSwiftUI
//
//  Created by Hossein Hajimirza on 5/16/23.
//

import SwiftUI

struct HomeTransferRowAvatar: View {
    let url: String
    
    var body: some View {
        CashedImage(url: url) { phase in
            switch phase {
            case .empty:
                ZStack {
                    Circle()
                        .fill(Color.gray.opacity(0.5))
                    ProgressView()
                }
            case .success(let image):
                image
                    .resizable()
                    .scaledToFit()
            case .failure(_):
                ZStack {
                    Circle()
                        .fill(Color.gray.opacity(0.5))
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                        .padding(12)
                }
            }
        }
        .clipShape(Circle())
    }
}

struct HomeTransferRowAvatar_Previews: PreviewProvider {
    static var previews: some View {
        HomeTransferRowAvatar(url: "")
    }
}
