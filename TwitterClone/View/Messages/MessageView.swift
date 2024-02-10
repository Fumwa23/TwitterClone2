//
//  MessageView.swift
//  TwitterClone
//
//  Created by Owen LS on 28/10/21.
//

import SwiftUI
import Kingfisher

struct MessageView: View {
    let message: Message
    var body: some View {
        HStack{
            if message.isFromCurrentUser == true {
                Spacer()
                Text(message.text)
                    .padding()
                    .background(Color.blue)
                    .clipShape(ChatBubble(isFromCurrentUser: true))
                    .foregroundColor(.white)
                    .padding(.horizontal)
                    .padding(.leading, 100)
            }else{
                HStack(alignment: .bottom){
                    KFImage(URL(string: message.user.profileImageUrl))
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 40)
                        .cornerRadius(40/2)
                        .padding(.leading)
                    
                    Text(message.text)
                        .padding()
                        .background(Color(.systemGray5))
                        .foregroundColor(.black)
                        .clipShape(ChatBubble(isFromCurrentUser: false))
                        .padding(.trailing)
                    
                    Spacer()
                }
                .padding(.trailing, 50)
            }
        }
    }
}

