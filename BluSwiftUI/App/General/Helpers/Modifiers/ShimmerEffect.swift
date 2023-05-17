//
//  ShimmerEffect.swift
//  BluSwiftUI
//
//  Created by Hossein Hajimirza on 5/17/23.
//

import SwiftUI

private struct ShimmerModifier: ViewModifier {
    @State private var size: CGSize = .zero
    @State private var show: Bool = false
    
    @Environment(\.colorScheme) var colorScheme
    
    func body(content: Content) -> some View {
        ZStack {
            content
                .readSize(onChange: { size in
                    self.size = size
                })
                .redacted(reason: .placeholder)
                .disabled(true)
            RoundedRectangle(cornerRadius: 8)
                .fill(LinearGradient(colors: [.clear, .gray.opacity(0.2), .clear], startPoint: .leading, endPoint: .trailing))
                .offset(x: show ? size.width : -size.width)
                .clipped()
                .frame(width: size.width, height: size.height)
        }
        .onAppear {
            withAnimation(.default.speed(0.3).delay(0).repeatForever(autoreverses: false)) {
                show.toggle()
            }
        }
    }
}

extension View {
    func shimmerEffect() -> some View {
        modifier(ShimmerModifier())
    }
}
