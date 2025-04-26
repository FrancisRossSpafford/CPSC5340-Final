//
//  ToDoItem.swift
//  CPSC5340-Final
//
//  Created by Ross Spafford on 4/26/25.
//

import Foundation
import FirebaseFirestore

struct ToDoItem: Identifiable, Codable {
    @DocumentID var id: String?
    var name: String
    var notes: String
    var category: String
    var dueDate: Date
    var userId: String
}
