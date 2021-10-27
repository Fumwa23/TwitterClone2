//
//  SwiftUIView.swift
//  TwitterClone
//
//  Created by Owen LS on 25/10/21.
//

import SwiftUI

struct ConversationsCell: View {
    var body: some View {
        
        VStack (alignment: .leading){
            HStack (spacing: 12){
                Image("batman")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 56, height: 56)
                    .cornerRadius(56/2)
                    .clipped()
                
                VStack (alignment: .leading, spacing: 4){
                    Text("insert user name")
                        .font(.system(size: 14, weight: .semibold))
                    
                    Text("last sent message this does and i guess so me ti mes it looks funny")
                        .font(.system(size: 14))
                        .lineLimit(2)
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

struct ConversationsCell_Previews: PreviewProvider {
    static var previews: some View {
        ConversationsCell()
    }
}
