//
//  UserProfileView.swift
//  TwitterClone
//
//  Created by Owen LS on 4/11/21.
//

import SwiftUI

struct UserProfileView: View {
    let user : User
    @ObservedObject var viewModel: ProfileViewModel
    
    @State var selectedFlter: TweetFilterOptions = .tweets
    
    
    init(user: User){
        self.user = user
        self.viewModel = ProfileViewModel(user: user)
    }
    
    var body: some View {
        ScrollView{
            VStack{
                ProfileHeaderView(/*isFollowed: $viewModel.isFollowed,*/ viewModel: viewModel)
                    .padding()
                
                FilterButtonView(selectedOption: $selectedFlter)
                
                ForEach(viewModel.tweets(forFilter: selectedFlter)) { tweet in
                    TweetCell(tweet: tweet)
                        .padding()
                    
                }
            }
            .navigationTitle(user.username)
        }
        
    }
}

