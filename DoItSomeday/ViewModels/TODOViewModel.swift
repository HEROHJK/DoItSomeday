//
//  TODOViewModel.swift
//  DoItSomeday
//
//  Created by 김호종 on 2022/01/10.
//

import Foundation
import UIKit
import CoreData

final class TODOViewModel {
    private var todos = [TODO]()
    
    var count: Int { todos.count }
    
    func get(at: Int) -> TODO? {
        if at >= 0, count > at {
            return todos[at]
        }
        
        return nil
    }
    
    init() {
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            let context = appDelegate.persistentContainer.viewContext
            if let todos = try? context.fetch(TODO.fetchRequest()) as [TODO] {
                self.todos = todos
            }
        }
    }
}
