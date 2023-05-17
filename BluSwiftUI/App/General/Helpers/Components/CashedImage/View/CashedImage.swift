//
//  CashedImage.swift
//  BluSwiftUI
//
//  Created by Hossein Hajimirza on 5/16/23.
//

import SwiftUI

struct CashedImage<Content: View>: View {
    @StateObject private var cashedImageViewModel: CashedImageViewModel = .init()
    let url: String
    @ViewBuilder let content: (CashedImagePhase) -> Content
    
    var body: some View {
        ZStack {
            getCurrentView()
        }
        .onAppear {
            Task {
                await cashedImageViewModel.load(url)
            }
        }
    }
    
    @ViewBuilder
    func getCurrentView() -> some View {
        switch cashedImageViewModel.currentState {
        case .loading:
            content(.empty)
        case .failed(error: let error):
            content(.failure(error))
        case .success(data: let data):
            if let image = UIImage(data: data) {
                content(.success(Image(uiImage: image)))
            } else {
                content(.failure(CashedImageError.invalidData))
            }
        default:
            content(.empty)
        }
    }
}

struct CashedImage_Previews: PreviewProvider {
    static var previews: some View {
        CashedImage(url: "https://www.dropbox.com/s/64y9lcnca22p1jx/avatar1.png?dl=1") { _ in
            EmptyView()
        }
    }
}

extension CashedImage {
    enum CashedImageError: Error {
        case invalidData
    }
}
