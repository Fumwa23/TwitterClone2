//
//  AuthViewModel.swift
//  TwitterClone
//
//  Created by Owen LS on 1/12/21.
//

import SwiftUI
import Firebase

class AuthViewModel: ObservableObject {
    
    @Published var userSession: FirebaseAuth.User?
    @Published var isAuthenicating = false
    @Published var error: Error?
    @Published var user: User?
    
    static let shared = AuthViewModel()
    
    init() {
        userSession = Auth.auth().currentUser
        fetchUser()
    }
    
    func login(withEmail email: String, password: String){
        
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error{
                print("DEBUG: failed to login: \(error.localizedDescription)")
                return
            }
            
            self.userSession = result?.user
            print("DEBUG: succesfully logged in")
            self.fetchUser()
        }
        
    }
    
    func registerUser(email: String, password: String, username: String, fullname: String, profileImage: UIImage){
        
        guard let imageData = profileImage.jpegData(compressionQuality: 0.3) else {return}
        let filename = NSUUID().uuidString
        let storageRef = Storage.storage().reference().child(filename)
        
        storageRef.putData(imageData, metadata: nil) { _, error in
            if let error = error{
                print("DEBUG: failed to upload image \(error.localizedDescription)")
                return
            }
            
            
            print("DEBUG: succesfully uploaded user photo...")
            
            storageRef.downloadURL { url, _ in
                guard let profileImageUrl = url?.absoluteString else {return}
                
                Auth.auth().createUser(withEmail: email, password: password) { result, error in
                    if let error = error {
                        print("DEBUG: error creating user \(error.localizedDescription)")
                        return
                    }
                    
                    guard let user = result?.user else {return}
                    
                    let data = ["email": email,
                                "username": username.lowercased(),
                                "fullname": fullname,
                                "profileImageUrl": profileImageUrl,
                                "uid": user.uid]
                    
                    Firestore.firestore().collection("users").document(user.uid).setData(data) { _ in
                        self.userSession = result?.user
                        self.fetchUser()
                    }
                    
                }
            }
        }
    }
    
    func signOut(){
        userSession = nil
        user = nil
        try? Auth.auth().signOut()
    }
    
    func fetchUser(){
        guard let uid = userSession?.uid else { return }
       //guard let uid2 = Auth.auth().currentUser?.uid else { return }
        
        Firestore.firestore().collection("users").document(uid).getDocument { snapshot, _ in
            guard let data = snapshot?.data() else {return}
            self.user = User(dictionary: data)
        }
        
    }
    
}
