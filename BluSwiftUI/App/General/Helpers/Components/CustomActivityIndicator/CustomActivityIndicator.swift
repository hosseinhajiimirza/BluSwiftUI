//
//  CustomActivityIndicator.swift
//  BluSwiftUI
//
//  Created by Hossein Hajimirza on 5/17/23.
//

import SwiftUI

struct CustomActivityIndicator: View {
    @State private var offset: Double = 0
    @State private var isRotated: Bool = false
    
    var body: some View {
        VStack(alignment: .center, spacing: 8) {
            ZStack {
                Circle()
                    .stroke(lineWidth: 2)
                    .frame(width: 36, height: 36)
                    .foregroundColor(.gray.opacity(0.3))
                Image(Images.logo.rawValue)
                    .resizable()
                    .clipShape(Circle())
                    .padding(4)
                    .frame(width: 36, height: 36)
                Circle()
                    .trim(from: (offset - 1), to: (0.3 + offset))
                    .stroke(lineWidth: 2)
                    .frame(width: 36, height: 36)
                    .foregroundColor(.blue)
                    .rotationEffect(Angle(degrees: isRotated ? (360) : 0))
            }
            Text("Saman Bank")
                .font(.caption)
                .fontWeight(.medium)
                .foregroundColor(.blue)
        }
        .onAppear {
            withAnimation(.linear(duration: 1)
                .repeatForever(autoreverses: false)) {
                    isRotated.toggle()
                }
            withAnimation(.linear(duration: 2.5)
                .repeatForever(autoreverses: true)) {
                    if offset == 0.5 {
                        offset -= 1
                    } else {
                        offset += 0.5
                    }
                }
        }
        .padding()
    }
    
}

struct CustomActivityIndicator_Previews: PreviewProvider {
    static var previews: some View {
        CustomActivityIndicator()
    }
}
