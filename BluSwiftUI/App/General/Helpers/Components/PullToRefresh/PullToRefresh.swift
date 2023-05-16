//
//  PullToRefresh.swift
//  BluSwiftUI
//
//  Created by Hossein Hajimirza on 5/15/23.
//

import SwiftUI

struct PullToRefresh: View {
    @State var needRefresh: Bool = false
    
    var coordinateSpaceName = CoordinateSpaceName.pullToRefresh.rawValue
    var onRefresh: (() -> Void)
    
    var body: some View {
        GeometryReader { geo in
            if (geo.frame(in: .named(coordinateSpaceName)).minY >= 20) {
                // When we pull to refresh
                Spacer()
                    .onAppear {
                        needRefresh = true
                    }
            } else if (geo.frame(in: .named(coordinateSpaceName)).maxY < 0) {
                // refresh action after hiding the indicator
                Spacer()
                    .onAppear {
                        if needRefresh {
                            Task {
                                withAnimation(.easeIn(duration: 0.1)) {
                                    // you can set a delay for it.
                                    needRefresh = false
                                }
                                Task {
                                    // To make it smooth, we set a 0.5 delay:
                                    try? await Task.sleep(nanoseconds: (0.5).toNanoSecends)
                                    onRefresh()
                                }
                            }
                        }
                    }
            }
            VStack {
                HStack {
                    Spacer()
                    if needRefresh {
                        CustomActivityIndicator()
                    }
                    Spacer()
                }
            }
        }
        .padding(.top, -54)
    }

}

struct PullToRefresh_Previews: PreviewProvider {
    static var previews: some View {
        PullToRefresh() {
            //
        }
    }
}
