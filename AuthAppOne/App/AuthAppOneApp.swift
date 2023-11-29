//
//  AuthAppOneApp.swift
//  AuthAppOne
//
//  Created by Ahmed Halilovic on 17. 11. 2023..
//

import SwiftUI
import Firebase

@main
struct AuthAppOneApp: App {
    @StateObject var viewModel = AuthViewModel()
    
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
