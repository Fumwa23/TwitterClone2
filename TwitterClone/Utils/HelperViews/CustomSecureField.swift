//
//  CustomSecureField.swift
//  TwitterClone
//
//  Created by Owen LS on 24/11/21.
//

import SwiftUI

struct CustomSecureField: View {
    @Binding var text: String
    let placeholder: Text
    //let image: Image
    
    
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty{
                placeholder
                    .foregroundColor(Color(.init(white: 1, alpha: 0.87)))
                    .padding(.leading, 40)
            }
            
            HStack(spacing: 16){
                Image(systemName: "lock")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.white)
                
                SecureField("", text: $text)
            }
            
        }
    }
}
