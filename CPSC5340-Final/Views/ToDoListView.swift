//
//  ToDoListView.swift
//  CPSC5340-Final
//
//  Created by Ross Spafford on 4/26/25.
//

import SwiftUI

struct ToDoListView: View {
    @StateObject private var viewModel = ToDoViewModel()
    @EnvironmentObject var authViewModel: AuthViewModel
    @State private var showAddItem = false

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.items) { item in
                    VStack(alignment: .leading) {
                        Text(item.name).font(.headline)
                        Text(item.notes).font(.subheadline)
                        Text("Category: \(item.category)").font(.caption)
                        Text("Due: \(item.dueDate.formatted())").font(.caption2)
                    }
                }
                .onDelete { indexSet in
                    indexSet.forEach { viewModel.deleteItem(viewModel.items[$0]) }
                }
            }
            .navigationTitle("My To-Dos")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Add") {
                        showAddItem = true
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Sign Out") {
                        authViewModel.signOut()
                    }
                }
            }
            .onAppear {
                if let user = authViewModel.user {
                    viewModel.fetchItems(for: user.uid)
                }
            }
            .sheet(isPresented: $showAddItem) {
                AddEditToDoView(viewModel: viewModel, userId: authViewModel.user?.uid ?? "")
            }
        }
    }
}

