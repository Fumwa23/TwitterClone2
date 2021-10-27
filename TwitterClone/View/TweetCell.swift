//
//  TweetCell.swift
//  TwitterClone
//
//  Created by Owen LS on 24/10/21.
//

import SwiftUI

struct TweetCell: View {
    var body: some View {
        VStack (alignment: .leading){
            HStack (alignment: .top, spacing: 12) {
                Image("batman")
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .frame(width: 56, height: 56)
                    .cornerRadius(56/2)
                    .padding(.leading)
                
                VStack(alignment: . leading, spacing: 4) {
                    HStack {
                        Text("Riccardo")
                            .font(.system(size: 14, weight: .semibold))
                        Text("@RiccardoStapStap •")
                            .foregroundColor(.gray)
                        Text("2w")
                            .foregroundColor(.gray)
                    }
                    
                    Text("Alpha Tauri kinda lame tho - said verstap ds")
                }
            }
            .padding(.bottom)
            .padding(.trailing)
            
            HStack {
                
                Button {
                } label: {
                    Image(systemName: "bubble.left")
                        .font(.system(size: 16))
                        .frame(width: 32, height: 32)
                        .foregroundColor(.gray)
                }
                
                Spacer()
                
                Button {
                    
                } label: {
                    Image(systemName: "arrow.2.squarepath")
                        .font(.system(size: 16))
                        .frame(width: 32, height: 32)
                    
                }
                
                Spacer()
                
                Button {
                } label: {
                    Image(systemName: "heart")
                        .font(.system(size: 16))
                        .frame(width: 32, height: 32)
                        .foregroundColor(.gray)
                    
                }
                
                Spacer()
                
                Button {
                } label: {
                    Image(systemName: "bookmark")
                        .font(.system(size: 16))
                        .frame(width: 32, height: 32)
                        .foregroundColor(.gray)
                }
            }
            .foregroundColor(.gray)
            .padding(.horizontal)
            
            Divider()
                .padding(.horizontal)
            
        }
        .padding(.leading, -4)
    }
}

struct TweetCell_Previews: PreviewProvider {
    static var previews: some View {
        TweetCell()
    }
}
