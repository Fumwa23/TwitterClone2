//
//  FeedViewModel.swift
//  TwitterClone
//
//  Created by Owen LS on 8/1/22.
//

import SwiftUI

class FeedViewModel: ObservableObject {
    @Published var tweets = [Tweet]()
    
    init() {
        fetchTweets()
    }
    
    func fetchTweets() {
        
        let query = COLLECTION_TWEETS
        let orderedQuery = query.order(by: "timestamp", descending: true)
                
        orderedQuery.getDocuments { snapshot, _ in
                    
            guard let documents = snapshot?.documents else {return}
            
            self.tweets = documents.map({ Tweet(dictionary: $0.data()) })
           // print("DEBUG: tweets \(self.tweets)")
            
            /// NOOB WAY BELOW
//            documents.forEach { documents in
//                let tweet = Tweet(dictionary: documents.data())
//
//                self.tweets.append(tweet)
//            }
        }
    }
}
