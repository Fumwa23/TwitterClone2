//
//  NewMessageView.swift
//  TwitterClone
//
//  Created by Owen LS on 28/10/21.
//

import SwiftUI

struct NewMessageView: View {
    @State var searchText = ""
    @Binding var showingNewMessageView: Bool
    @Binding var startChat: Bool
    @Binding var user: User?
    @ObservedObject var viewModel = SearchViewModel(config: .newMessage)
    
    var body: some View {
        
        ScrollView{
            SearchBar(text: $searchText)
                .padding()
            
            VStack (alignment: .leading){
                ForEach(searchText.isEmpty ? viewModel.users : viewModel.filteredUser(searchText)) { user in
                    HStack { Spacer()}
                //this looks different to his code, i have run the showChat code in the conversationsView in the on dismiss section of the sheet - his stupid fucking method doesnt work
                    Button {
                        self.showingNewMessageView.toggle()
                       // self.startChat.toggle()
                        self.user = user
                    } label: {
                        UserCell(user: user)
                    }

                }
            }.padding(.leading)
            
        }
        //.navigationBarTitle("Search")
    }
}

