//
//  Details.swift
//  BluSwiftUI
//
//  Created by Hossein Hajimirza on 5/16/23.
//

import SwiftUI

struct Details: View {
    @ObservedObject var homeViewModel: HomeViewModel
    let homeModel: HomeModel
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)) {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 32) {
                    HStack {
                        BluCard(homeModel: homeModel)
                            .offset(x: 32)
                        Spacer(minLength: 0)
                        DetailsPageAvatar(url: homeModel.person.avatar)
                            .offset(x: -32)
                    }
                    TransferInfo(homeModel: homeModel)
                }
                .padding()
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    //
                } label: {
                    Image(systemName: "star")
                        .imageScale(.large)
                        .foregroundColor(.yellow)
                }
            }
        }
        .navigationTitle("Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct Details_Previews: PreviewProvider {
    static var previews: some View {
        Details(homeViewModel: .init(), homeModel: .init())
    }
}
