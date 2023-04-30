//
//  TodoStoreViewModel.swift
//  TodoApp
//
//  Created by ASKER on 30.04.2023.
//

import Foundation

class TodoStoreViewModel:ObservableObject{
    @Published var listItems:[TodoType] = []
    
    func addTodoType(todo:TodoType){
        listItems.append(todo)
        
    }
    
    func removeTodoType(id:UUID){
       listItems = listItems.filter { el in
            el.id != id
        }
    }
}
