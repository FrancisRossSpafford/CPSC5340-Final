//
//  ToDoViewModel.swift
//  CPSC5340-Final
//
//  Created by Ross Spafford on 4/26/25.
//

import Foundation
import FirebaseFirestore

class ToDoViewModel: ObservableObject {
    @Published var items: [ToDoItem] = []
    private var db = Firestore.firestore()

    func fetchItems(for userId: String) {
        db.collection("todos")
            .whereField("userId", isEqualTo: userId)
            .addSnapshotListener { snapshot, error in
                guard let documents = snapshot?.documents else { return }
                self.items = documents.compactMap { try? $0.data(as: ToDoItem.self) }
            }
    }

    func addItem(_ item: ToDoItem) {
        try? db.collection("todos").addDocument(from: item)
    }

    func updateItem(_ item: ToDoItem) {
        guard let id = item.id else { return }
        try? db.collection("todos").document(id).setData(from: item)
    }

    func deleteItem(_ item: ToDoItem) {
        guard let id = item.id else { return }
        db.collection("todos").document(id).delete()
    }
}
