//
//  UserCell.swift
//  TwitterClone
//
//  Created by Owen LS on 25/10/21.
//

import SwiftUI
import Kingfisher

struct UserCell: View {
    
    let user: User
    
    var body: some View {
        VStack(alignment: .leading){
            HStack (spacing: 12){
                KFImage(URL(string: user.profileImageUrl))
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .frame(width: 56, height: 56)
                    .cornerRadius(28)
                
                VStack (alignment: .leading) {
                    Text(user.username)
                        .font(.system(size: 14, weight: .semibold))
                    
                    Text(user.fullname)
                        .font(.system(size: 14))
                }
                .foregroundColor(.black)
                
                Spacer()
                
            }
           // .padding(.leading)
        }
        .padding(.leading, -4)
    }
}
