//
//  CPSC5340_FinalApp.swift
//  CPSC5340-Final
//
//  Created by Ross Spafford on 4/26/25.
//

import SwiftUI
import Firebase

@main
struct CPSC5340_FinalApp: App {
    @StateObject var authViewModel = AuthViewModel()

    init() {
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            if authViewModel.user != nil {
                ToDoListView()
                    .environmentObject(authViewModel)
            } else {
                SignInView()
                    .environmentObject(authViewModel)
            }
        }
    }
}
