//
//  ChatViewModel.swift
//  TwitterClone
//
//  Created by Owen LS on 11/1/22.
//

import SwiftUI
import Firebase

class ChatViewModel: ObservableObject {
    
    @Published var messages = [Message]()
    let user : User
    
    init(user: User) {
        self.user = user
        fetchMessages()
    }
    
    func fetchMessages(){
        guard let uid = AuthViewModel.shared.userSession?.uid else {return}
        
        let query = COLLECTION_MESSAGES.document(uid).collection(user.id).order(by: "timestamp", descending: false)
        
        query
        
        query.addSnapshotListener { snapshot, error in
            
            if error != nil {
                print("DEBUG: error with fetching recent messages \(error?.localizedDescription ?? "")")
            }
            
            guard let changes = snapshot?.documentChanges.filter({$0.type == .added}) else {return}
            
            changes.forEach { change in
                let messageData = change.document.data()
                guard let fromId = messageData["fromId"] as? String else {return}
                
                COLLECTION_USERS.document(uid).getDocument { snapshot, _ in
                    guard let data = snapshot?.data() else { return }
                    let user = User(dictionary: data)
                    self.messages.append(Message(user: user, dictionary: messageData))
                    
                }
            }
            
        }
    }
    
    func sendMessage(_ messageText: String) {
        guard let currentUid = AuthViewModel.shared.userSession?.uid else {return}
        let currentUserRef = COLLECTION_MESSAGES.document(currentUid).collection(user.id).document()
        let receivingUserRef = COLLECTION_MESSAGES.document(user.id).collection(currentUid)
        let receivingRecentRef = COLLECTION_MESSAGES.document(user.id).collection("recent-messages")
        let currentRecentRef = COLLECTION_MESSAGES.document(currentUid).collection("recent-messages")

        let messageID = currentUserRef.documentID
        
        let data: [String: Any] = ["text": messageText,
                    "id": messageID,
                    "fromId": currentUid,
                    "toId": user.id,
                    "timestamp": Timestamp(date: Date())]
        
        currentUserRef.setData(data)
        receivingUserRef.document(messageID).setData(data)
        receivingRecentRef.document(currentUid).setData(data)
        currentRecentRef.document(user.id).setData(data)
        
    }
}
