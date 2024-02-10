//
//  SearchViewModel.swift
//  TwitterClone
//
//  Created by Owen LS on 19/12/21.
//

import Foundation
import Firebase

enum SearchViewModelConfiguration {
    case search
    case newMessage
}

class SearchViewModel: ObservableObject {
    
    @Published var users = [User]()
    private let config: SearchViewModelConfiguration
    
    init(config: SearchViewModelConfiguration) {
        self.config = config
        fetchUsers()
    }
    
    
    func fetchUsers(){
        //get users from firebase
        COLLECTION_USERS.getDocuments { snapshot, _ in
            
            guard let documents = snapshot?.documents else { return }
            let users = documents.map({User(dictionary: $0.data())})

            
            switch self.config {
            case.newMessage:
                self.users = users.filter({ !$0.isCurrentUser })
            case.search:
                // The thing below is an advanced thing but i dont understand how tf that works so use the long way below.
                self.users = users
                
    //            documents.forEach { document in
    //                let user = User(dictionary: document.data())
    //                self.users.append(user)
    //            }
            }
            
            
            
        }
    }
    
    func filteredUser (_ query: String) -> [User] {
        let lowercasedQuery = query.lowercased()
        return users.filter({ $0.fullname.lowercased().contains(lowercasedQuery) || $0.username.contains(lowercasedQuery) })
    }
    
}
