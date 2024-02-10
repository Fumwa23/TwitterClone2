//
//  SwiftUIView.swift
//  TwitterClone
//
//  Created by Owen LS on 25/10/21.
//

import SwiftUI
import Kingfisher

struct ConversationsCell: View {
    let message: Message
    
    var body: some View {
        
        VStack (alignment: .leading){
            HStack (spacing: 12){
                KFImage(URL(string: message.user.profileImageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 56, height: 56)
                    .cornerRadius(56/2)
                    .clipped()
                
                VStack (alignment: .leading, spacing: 4){
                    Text(message.user.fullname)
                        .font(.system(size: 14, weight: .semibold))
                    
                    Text(message.text)
                        .font(.system(size: 14))
                        .lineLimit(2)
                        .frame(alignment: .leading)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.gray)
                    
                }
                .foregroundColor(.black)
                .frame(height: 64)
                .padding(.trailing)
            }
            
            Divider()
                .padding(.horizontal)
        }
        .padding(.leading, -4)
    }
}

