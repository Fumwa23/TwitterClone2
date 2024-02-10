//
//  MessageInputView.swift
//  TwitterClone
//
//  Created by Owen LS on 28/10/21.
//

import SwiftUI

struct MessageInputView: View {
    
//    let viewModel: ChatViewModel
    @Binding var messageText: String
    
    var action: () -> Void
    
    var body: some View {
        HStack {
            TextField("Message...", text: $messageText)
                .textFieldStyle(PlainTextFieldStyle())
                .frame(minHeight: 30)
            
            Button(action: action) {
                Text("Send")
            }

        }
    }
}

