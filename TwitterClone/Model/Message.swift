//
//  Message.swift
//  TwitterClone
//
//  Created by Owen LS on 28/10/21.
//

import Foundation
import Firebase

struct Message: Identifiable {
    
    let id: String
    let text: String
    let user: User
    let toId: String
    let fromId: String
    let isFromCurrentUser: Bool
    
    var chatPartnerId: String { return isFromCurrentUser ? toId : fromId }
    
    init(user: User, dictionary: [String: Any]) {
        
        self.user = user
        self.text = dictionary["text"] as? String ?? ""
        self.toId = dictionary["toId"] as? String ?? ""
        self.fromId = dictionary["fromId"] as? String ?? ""
        self.isFromCurrentUser = fromId == Auth.auth().currentUser?.uid
        self.id = dictionary["id"] as? String ?? ""
        
    }
}

struct MockMessage: Identifiable {
    let id: Int
    let imageName: String
    let messageText: String
    let isCurrentUser: Bool
}

let MOCK_MESSAGES: [MockMessage] = [
    .init(id: 0, imageName: "spiderman", messageText: "filler test message not from api", isCurrentUser: false),
    .init(id: 1, imageName: "batman", messageText: "super fake respond message", isCurrentUser: true),
    .init(id: 2, imageName: "batman", messageText: "filler test message not from api", isCurrentUser: true),
    .init(id: 3, imageName: "spiderman", messageText: "more super real conversations", isCurrentUser: false),
    .init(id: 4, imageName: "spiderman", messageText: "btw did u know this is a scam", isCurrentUser: false),
]

