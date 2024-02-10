//
//  SearchView.swift
//  TwitterClone
//
//  Created by Owen LS on 25/10/21.
//

import SwiftUI

struct SearchView: View {
    @State var searchText = ""
    @ObservedObject var viewModel = SearchViewModel(config: .search)
    
    var body: some View {
        
        ScrollView{
            SearchBar(text: $searchText)
                .padding()
            
            VStack (alignment: .leading){
                ForEach(searchText.isEmpty ? viewModel.users : viewModel.filteredUser(searchText)) { user in
                    HStack { Spacer()}
                    
                    NavigationLink{
                        LazyView(UserProfileView(user: user))
                    } label: {
                        UserCell(user: user)
                    }

                }
            }.padding(.leading)
            
        }
        //.navigationBarTitle("Search")
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
