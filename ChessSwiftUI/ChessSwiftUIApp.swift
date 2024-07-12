//
//  ChessSwiftUIApp.swift
//  ChessSwiftUI
//
//  Created by Norbert Szawloga on 17/12/2021.
//

import SwiftUI
import Firebase

@main
struct ChessSwiftUIApp: App {
    
    
    init(){
        FirebaseApp.configure()
        
        let db = Firestore.firestore()
        
        print(db)
    }
    
    
    var body: some Scene {
        WindowGroup {
            
            WelcomeScreen()
        }
    }
}
