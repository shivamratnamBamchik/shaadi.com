//
//  ShimmerView.swift
//  MatchMaking
//
//  Created by Shivam Ratnam on 06/09/24.
//
import SwiftUI

struct ShimmerView: View {
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.gray.opacity(0.3))
                .frame(width: 150, height: 150)
                .shimmering()
            
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.gray.opacity(0.3))
                .frame(width: 150, height: 24)
                .shimmering()
            
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.gray.opacity(0.3))
                .frame(width: 150, height: 18)
                .shimmering()
            
            HStack(spacing: 50) {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.gray.opacity(0.3))
                    .frame(width: 40, height: 40)
                    .shimmering()
                
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.gray.opacity(0.3))
                    .frame(width: 40, height: 40)
                    .shimmering()
            }
            .padding(.top, 10)
        }
        .frame(width: 300, height: 300)
        .padding(.horizontal, 20)
    }
}

extension View {
    func shimmering() -> some View {
        self.overlay(
            LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.3), Color.white.opacity(0.6), Color.white.opacity(0.3)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .rotationEffect(.degrees(30))
                .mask(self)
                .offset(x: -200)
                .animation(Animation.linear(duration: 1.2).repeatForever(autoreverses: false))
        )
    }
}
