//
//  TwitterCloneApp.swift
//  TwitterClone
//
//  Created by Owen LS on 21/10/21.
//

import SwiftUI
import Firebase

@main
struct TwitterCloneApp: App {
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView(/*selectedIndex: 0*/).environmentObject(AuthViewModel.shared)
        }
    }
}
