//
//  AuthViewModel.swift
//  CPSC5340-Final
//
//  Created by Ross Spafford on 4/26/25.
//

import FirebaseAuth
import Combine

class AuthViewModel: ObservableObject {
    @Published var user: User?

    init() {
        self.user = Auth.auth().currentUser
    }

    func signIn(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let result = result {
                DispatchQueue.main.async {
                    self.user = result.user
                }
            }
        }
    }

    func signUp(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let result = result {
                DispatchQueue.main.async {
                    self.user = result.user
                }
            }
        }
    }

    func signOut() {
        try? Auth.auth().signOut()
        self.user = nil
    }
}
