//
//  Details.swift
//  BluSwiftUI
//
//  Created by Hossein Hajimirza on 5/16/23.
//

import SwiftUI

struct Details: View {
    /*
     name, email, avatar
     card: number, type
     transfer: date, numberOf, total
     */
    @ObservedObject var homeViewModel: HomeViewModel
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)) {
            ScrollView(.vertical, showsIndicators: false) {
                BluCard()
            }
        }
    }
}

struct Details_Previews: PreviewProvider {
    static var previews: some View {
        Details(homeViewModel: .init())
    }
}
