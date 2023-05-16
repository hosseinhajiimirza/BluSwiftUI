//
//  HomeTransferLoading.swift
//  BluSwiftUI
//
//  Created by Hossein Hajimirza on 5/17/23.
//

import SwiftUI

struct HomeTransferLoading: View {
    var body: some View {
        VStack {
            HomeTransferLoadingRow()
            HomeTransferLoadingRow()
            HomeTransferLoadingRow()
        }
    }
}

struct HomeTransferLoading_Previews: PreviewProvider {
    static var previews: some View {
        HomeTransferLoading()
    }
}
