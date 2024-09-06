//
//  ProfileCardView.swift
//  MatchMaking
//
//  Created by Shivam Ratnam on 05/09/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct ProfileCardView: View {
    let profile: ProfileModel
    var onDecision: (Bool, String) -> Void
    
    @State private var status: String?
    @State private var isLoading: Bool = true
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                if isLoading {
                    ShimmerView()
                } else {
                    WebImage(url: URL(string: profile.imageURL)) { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fill)
                    } placeholder: {
                        Color.gray
                    }
                    .frame(width: 150, height: 150)
                    .clipShape(Circle())
                    
                    Text(profile.name)
                        .font(.system(size: 24))
                        .fontWeight(.bold)
                        .foregroundColor(.indigo)
                    
                    Text("\(profile.age), \(profile.location)")
                        .font(.system(size: 18))
                        .fontWeight(.regular)
                        .foregroundColor(.gray)
                    
                    if let status = status {
                        Text(status)
                            .foregroundColor(status == "Accepted" ? .green : .red)
                            .padding(.top, 5)
                            .padding(.vertical, 10)
                            .frame(width: geometry.size.width - 40)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(status == "Accepted" ? Color.green : Color.red, lineWidth: 2)
                            )
                            .padding(.horizontal, 20)
                    } else {
                        HStack(spacing: 50) {
                            Image(systemName: "xmark.circle")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 40, height: 40)
                                .foregroundColor(.indigo)
                                .onTapGesture {
                                    status = "Declined"
                                    onDecision(false, profile.id)
                                }
                            
                            Image(systemName: "checkmark.circle")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 40, height: 40)
                                .foregroundColor(.indigo)
                                .onTapGesture {
                                    status = "Accepted"
                                    onDecision(true, profile.id)
                                }
                        }
                        .padding(.top, 10)
                    }
                }
            }
            .frame(width: geometry.size.width - 40, height: 300)
            .padding(.horizontal, 20)
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 5)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    isLoading = false
                }
            }
        }
        .frame(height: 300)
    }
}
