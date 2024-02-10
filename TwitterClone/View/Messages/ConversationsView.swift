//
//  ConversationsView.swift
//  TwitterClone
//
//  Created by Owen LS on 25/10/21.
//

import SwiftUI

struct ConversationsView: View {
    @State var isShowingNewMessageView = false
    @State var showChat: Bool = false
    @State var user: User?
    @ObservedObject var viewModel = ConversationViewModel()
    
    var body: some View {
        ZStack (alignment: .bottomTrailing){
            
            if let user = user{
                NavigationLink(destination: LazyView(ChatView(user: user)),
                               isActive: $showChat,
                               label: {} )
                
            }

            
            ScrollView{
                VStack(alignment: .leading){
                    ForEach(viewModel.recentMessages){ message in
                        
                        Button {
                            showChat.toggle()
                        } label: {
                            ConversationsCell(message: message)
                                .frame(alignment: .leading)
                        }

                        
//                        NavigationLink {
//                            LazyView(ChatView(user: message.user))
//                        } label: {
//                            ConversationsCell(message: message)
//                                .frame(alignment: .leading)
//
//                        }
                        
                    }
                }
                .padding()
            }
            
            Button {
                self.isShowingNewMessageView.toggle()
                print("DEBUG: show chat is \(showChat)")
            } label: {
                Image(systemName: "envelope")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 28, height: 28)
                    .padding()
            }
            .background(Color(.systemBlue))
            .foregroundColor(.white)
            .clipShape(Circle())
            .padding()
            .sheet(isPresented: $isShowingNewMessageView) {
                                
                    showChat.toggle()

            } content: {
                NewMessageView(showingNewMessageView: $isShowingNewMessageView, startChat: $showChat, user: $user)
            }
        }
    }
}

struct ConversationsView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationsView()
    }
}
