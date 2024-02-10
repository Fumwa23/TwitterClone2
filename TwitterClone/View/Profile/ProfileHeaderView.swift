//
//  ProfileHeaderView.swift
//  TwitterClone
//
//  Created by Owen LS on 4/11/21.
//

import SwiftUI
import Kingfisher

struct ProfileHeaderView: View {
    
    //@Binding var isFollowed: Bool
    @ObservedObject var viewModel: ProfileViewModel
    
    var body: some View {
        VStack{
            KFImage(URL(string: viewModel.user.profileImageUrl))
                .resizable()
                .scaledToFill()
                .clipped()
                .frame(width: 120, height: 120, alignment: .center)
                .clipShape(Circle())
                .shadow(color: .black, radius: 10, x: 0, y: 0)
            
            Text(viewModel.user.fullname)
                .font(.system(size: 16, weight: .semibold))
                .padding(.top)
            
            Text("@\(viewModel.user.username)")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Text("Stupid message about myself")
                .font(.system(size: 14))
                .padding(.top, 8)
            
            HStack(spacing: 40){
                VStack{
                    Text("\(viewModel.user.stats.followers)")
                        .font(.system(size: 16)).bold()
                    
                    Text("Follower")
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
                
                VStack{
                    Text("\(viewModel.user.stats.following)")
                        .font(.system(size: 16)).bold()
                    
                    Text("Following")
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
            }
            .padding()
            
            ProfileActionButtonView(viewModel: viewModel/*, isFollowed: $isFollowed*/)
            
            Spacer()
        }
    }
}


