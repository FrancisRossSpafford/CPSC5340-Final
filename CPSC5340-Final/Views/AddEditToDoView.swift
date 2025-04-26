//
//  AddEditToDoView.swift
//  CPSC5340-Final
//
//  Created by Ross Spafford on 4/26/25.
//

import SwiftUI

struct AddEditToDoView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel: ToDoViewModel
    var userId: String

    @State private var name = ""
    @State private var notes = ""
    @State private var category = ""
    @State private var dueDate = Date()

    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                TextField("Notes", text: $notes)
                TextField("Category", text: $category)
                DatePicker("Due Date", selection: $dueDate, displayedComponents: .date)
            }
            .navigationTitle("New To-Do")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        let newItem = ToDoItem(name: name, notes: notes, category: category, dueDate: dueDate, userId: userId)
                        viewModel.addItem(newItem)
                        dismiss()
                    }
                }

                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") { dismiss() }
                }
            }
        }
    }
}
