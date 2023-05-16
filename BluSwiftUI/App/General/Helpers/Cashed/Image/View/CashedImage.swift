//
//  CashedImage.swift
//  BluSwiftUI
//
//  Created by Hossein Hajimirza on 5/16/23.
//

import SwiftUI

struct CashedImage: View {
    @StateObject private var cashedImageManager: CashedImageManager = .init()
    let url: String
    
    var body: some View {
        ZStack {
            if let data = cashedImageManager.data,
               let uiImage = UIImage(data: data) {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFit()
            }
        }
        .onAppear {
            Task {
                await cashedImageManager.load(url)
            }
        }
    }
}

struct CashedImage_Previews: PreviewProvider {
    static var previews: some View {
        CashedImage(url: "https://www.dropbox.com/s/64y9lcnca22p1jx/avatar1.png?dl=1")
    }
}
