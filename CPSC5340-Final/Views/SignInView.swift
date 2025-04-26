//
//  SignInView.swift
//  CPSC5340-Final
//
//  Created by Ross Spafford on 4/26/25.
//

import SwiftUI

struct SignInView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    @State private var email = ""
    @State private var password = ""
    @State private var isSignUp = false
    
    var body: some View {
        VStack(spacing: 16) {
            
            Image(systemName: "checkmark.circle.fill")
                .resizable()
                .frame(width: 80, height: 80)
                .foregroundColor(.blue)
            Text("Task Master")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            VStack(spacing: 4) {
                Text("Ross Spafford")
                    .font(.title2)
                    .foregroundColor(.secondary)
                Text("CPSC 5340 Spring 2025")
                    .font(.title2)
                    .foregroundColor(.secondary)
                    .padding(.bottom, 8)
                Text("A task manager using Google Firebase authentication and Storage.")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            .padding(.bottom, 20)
            
            TextField("Email", text: $email)
                .textFieldStyle(.roundedBorder)
                .autocapitalization(.none)
            
            SecureField("Password", text: $password)
                .textFieldStyle(.roundedBorder)
            
            Button(isSignUp ? "Sign Up" : "Sign In") {
                if isSignUp {
                    authViewModel.signUp(email: email, password: password)
                } else {
                    authViewModel.signIn(email: email, password: password)
                }
            }
            
            Button(isSignUp ? "Already have an account? Sign In" : "Don't have an account? Sign Up") {
                isSignUp.toggle()
            }
        }
        .padding()
    }
}
