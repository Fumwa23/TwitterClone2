//
//  ContentView.swift
//  TwitterClone
//
//  Created by Owen LS on 21/10/21.
//

import SwiftUI
import Kingfisher

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        
        Group {
            if viewModel.userSession != nil {
                NavigationView {
                    
                    TabView {
                    
                        FeedView()
                            .tabItem {
                                Image(systemName: "house")
                                Text("Home")
                            }
                        
                        SearchView()
                            .tabItem {
                                Image(systemName: "magnifyingglass")
                                Text("Search")
                            }
                        
                        ConversationsView()
                            .tabItem {
                                Image(systemName: "envelope")
                                Text("Messages")
                            }
                    }
                    .preferredColorScheme(.light)
                    .navigationTitle("Home")
                    .navigationBarHidden(false)
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar(content: {
                        ToolbarItem(placement: .navigationBarLeading) {
                            
                            Button {
                                viewModel.signOut()
                            } label: {
                                if let user = viewModel.user {
                                    KFImage(URL(string: user.profileImageUrl))
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 32, height: 32)
                                        .cornerRadius(32/2)
                                }
                            }
                        }
                    })
                    
                    
                    //HIS CODE BUT IT IS OLD AND OUTDATED, THE ABOVE IS BETTER
//                    .navigationBarTitle("Home")
//                    .navigationBarHidden(false)
//                    .navigationBarTitleDisplayMode(.inline)
//
//                    .navigationBarItems(leading: Button(action: {
//
//                        viewModel.signOut()
//
//                    }, label: {
//
//                        if let user = viewModel.user {
//                            KFImage(URL(string: user.profileImageUrl))
//                                .resizable()
//                                .scaledToFill()
//                                .frame(width: 32, height: 32)
//                                .cornerRadius(32/2)
//                        }
//
//                    }))
                    
                }
            }else{
                LoginView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
