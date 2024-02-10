//
//  UploadTweetViewModel.swift
//  TwitterClone
//
//  Created by Owen LS on 8/1/22.
//

import SwiftUI
import Firebase

class UploadTweetViewModel: ObservableObject {
    
    @Binding var isPresented: Bool
    
    init(isPresented: Binding<Bool>) {
        self._isPresented = isPresented
    }
    
    func uploadTweer(caption: String){
        // same as auth.auth.currentUser.uid
        guard let user = AuthViewModel.shared.user else { return }
        
        let docRef = COLLECTION_TWEETS.document()
        
        let data: [String: Any] = ["uid": user.id,
                                   "caption": caption,
                                   "fullname": user.fullname,
                                   "timestamp": Timestamp(date: Date()),
                                   "username": user.username,
                                   //owen u dumby u type "URl" instead of "Url"
                                   "profileImageURl": user.profileImageUrl,
                                   "likes" : 0,
                                   "id": docRef.documentID]
        
        docRef.setData(data) { _ in
            print("DEBUG: Successfully uploaded tweet")
            self.isPresented = false
        }
    }
 
    //BELOW IS THE CODE USING A COMPLETION HANDLER INSTEAD, I HAVE MADE TWO DIFFERENT FUNCTIONS
    //THE TWEET BUTTON IN NEWTWEETS VIEW SHOWS THEM BOTH AND HOW THEY WORK
    
    func uploadTweer(caption: String, completion: @escaping((Error?) -> Void)){
        // same as auth.auth.currentUser.uid
        guard let user = AuthViewModel.shared.user else { return }
        
        let docRef = COLLECTION_TWEETS.document()
        
        let data: [String: Any] = ["uid": user.id,
                                   "caption": caption,
                                   "fullname": user.fullname,
                                   "timestamp": Timestamp(date: Date()),
                                   "username": user.username,
                                   "profileImageURl": user.profileImageUrl,
                                   "likes" : 0,
                                   "id": docRef.documentID]
        
        docRef.setData(data, completion: completion)
    }
    
    
}

