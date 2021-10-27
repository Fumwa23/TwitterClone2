//
//  SearchView.swift
//  TwitterClone
//
//  Created by Owen LS on 25/10/21.
//

import SwiftUI

struct SearchView: View {
    @State var searchText = ""
    var body: some View {
        
        ScrollView{
            SearchBar(text: $searchText)
                .padding()
            
            VStack (alignment: .leading){
                ForEach(0..<10) { _ in
                    HStack { Spacer()}
                    UserCell()
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
