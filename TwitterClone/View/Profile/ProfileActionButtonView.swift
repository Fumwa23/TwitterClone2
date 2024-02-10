//
//  ProfileActionButtonView.swift
//  TwitterClone
//
//  Created by Owen LS on 4/11/21.
//

import SwiftUI

struct ProfileActionButtonView: View {
    
    @ObservedObject var viewModel: ProfileViewModel
    //@Binding var isFollowed: Bool
    
    var body: some View {
        
        if viewModel.user.isCurrentUser == true {
            
            Button {
            } label: {
                Text("Edit Profile")
                    .frame(width: 360, height: 40)
                    .background(Color.blue)
                    .foregroundColor(.white)
            }
            .cornerRadius(20)
            
        }else{
            HStack{
                Button {
                    /*
                     This structure is: isFollowed ? true : false. so it checks to see if the @Published var is true or not and then if it is true it does the first and if it is false it does the second
                     
                     the following would do the same thing
                     
                     if isFollowed == true{
                     viewModel.unfollow()
                     } else {
                     viewModel.follow()
                     }
                     
                     */

                    viewModel.user.isFollowed ? viewModel.unfollow() : viewModel.follow()
                    

                    
                    print("DEBUG: followers: \(viewModel.user.stats.followers)")
                    
                } label: {
                    Text(viewModel.user.isFollowed ? "Following" : "Follow")
                        .frame(width: 180, height: 40)
                        .background(Color.blue)
                        .foregroundColor(.white)
                }
                .cornerRadius(20)

                NavigationLink {
                    ChatView(user: viewModel.user)
                } label: {
                    Text("Message")
                        .frame(width: 180, height: 40)
                        .background(Color.purple)
                        .foregroundColor(.white)
                }
                .cornerRadius(20)


                
            }
            
        }
       
    }
}


