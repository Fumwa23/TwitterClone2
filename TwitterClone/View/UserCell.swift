//
//  UserCell.swift
//  TwitterClone
//
//  Created by Owen LS on 25/10/21.
//

import SwiftUI

struct UserCell: View {
    var body: some View {
        VStack(alignment: .leading){
            HStack (spacing: 12){
                Image("batman")
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .frame(width: 56, height: 56)
                    .cornerRadius(28)
                
                VStack (alignment: .leading) {
                    Text("Richardio")
                        .font(.system(size: 14, weight: .semibold))
                    
                    Text("Riccardos Name")
                        .font(.system(size: 14))
                }
                
            }
           // .padding(.leading)
        }
        .padding(.leading, -4)
    }
}

struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
        UserCell()
    }
}
