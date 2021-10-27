//
//  ConversationsView.swift
//  TwitterClone
//
//  Created by Owen LS on 25/10/21.
//

import SwiftUI

struct ConversationsView: View {
    @State var isShowingNewMessageView = false
    var body: some View {
        ZStack (alignment: .bottomTrailing){
            ScrollView{
                VStack{
                    ForEach(0..<10){ _ in
                        NavigationLink {
                            Text("Destination")
                        } label: {
                            ConversationsCell().frame(alignment: .leading)
                        }
                        
                    }
                }
                .padding()
            }
            
            Button {
                self.isShowingNewMessageView.toggle()
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
                print("DEBUG: thing was dismissed")
                //it works thats mad
            } content: {
                SearchView()
            }


        }
    }
}

struct ConversationsView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationsView()
    }
}
