//
//  ToDoDTO.swift
//  to-do
//
//  Created by mert.kutluca on 5.03.2021.
//

import Foundation

struct ToDoDTO {
    let _id: String
    let title: String
    let detail: String
    let dueDate: Date
    let state: ToDoState
}
