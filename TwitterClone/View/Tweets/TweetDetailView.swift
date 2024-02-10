//
//  TweetDetailView.swift
//  TwitterClone
//
//  Created by Owen LS on 9/1/22.
//

import SwiftUI
import Kingfisher

struct TweetDetailView: View {
    
    let tweet: Tweet
    
    var body: some View {

        VStack(alignment: .leading, spacing: 16){
            
            HStack{
                
                KFImage(URL(string: tweet.profileImageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 56, height: 56)
                    .clipShape(Circle())
                
                VStack(alignment: .leading, spacing: 4){
                    
                    Text(tweet.fullname)
                        .font(.system(size: 14, weight: .semibold))
                    
                    Text("@\(tweet.username)")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                    
                }
                
            }
            
            Text(tweet.caption)
                .font(.system(size: 22))
            
            Text(tweet.detailedTimestampString)
                .foregroundColor(.gray)
                .font(.system(size: 14))
            
            Divider()
            
            HStack (spacing: 12){
                
                HStack(spacing: 4){
                    Text("\(tweet.likes)")
                        .font(.system(size: 14, weight: .semibold))
                    
                    Text("Retweets")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                }
                
                HStack(spacing: 4){
                    Text("\(tweet.likes)")
                        .font(.system(size: 14, weight: .semibold))
                    
                    Text("likes")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                }
                
            }
            
            Divider()
            
            TweetActionsView(tweet: tweet)
            
            Spacer()
            
        }
        .padding()
        
    }
}

