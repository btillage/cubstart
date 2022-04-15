//
//  Quizlet_ishApp.swift
//  Quizlet-ish
//
//  Created by Berry Tillage on 4/15/22.
//


import SwiftUI
import Firebase

@main
struct quizlet_ishApp: App {
    
    init() {
        FirebaseApp.configure()
        AuthenticationService.signIn()
      }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
