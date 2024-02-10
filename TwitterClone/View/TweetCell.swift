//
//  TweetCell.swift
//  TwitterClone
//
//  Created by Owen LS on 24/10/21.
//

import SwiftUI
import Kingfisher

struct TweetCell: View {
    
    let tweet: Tweet
    
    var body: some View {
        VStack (alignment: .leading){
            HStack (alignment: .top, spacing: 12) {
                KFImage(URL(string: tweet.profileImageUrl))
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .frame(width: 56, height: 56)
                    .cornerRadius(56/2)
                    .padding(.leading)
                
                VStack(alignment: . leading, spacing: 4) {
                    HStack {
                        Text(tweet.fullname)
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.black)
                        
                        Text("@\(tweet.username) •")
                            .foregroundColor(.gray)
                            .lineLimit(1)
                        
                        Text(tweet.timestampString)
                            .foregroundColor(.gray)
        
                    }
                    
                    Text(tweet.caption)
                        .foregroundColor(.black)
                        .multilineTextAlignment(.leading)
                }
            }
            .padding(.bottom)
            .padding(.trailing)
            
            TweetActionsView(tweet: tweet)
            
            Divider()
                .padding(.horizontal)
            
        }
        .padding(.leading, -4)
    }
}


