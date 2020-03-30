//
//  Todo.swift
//  Testes
//
//  Created by Jessica Guiot and Lucas Alves on 12/03/20.
//  Copyright © 2020 Jessica Guiot. All rights reserved.
//

import Foundation

var categoryTest = Category(name: "Academy")


struct Todo {
    
    var goals: [Goal] = []
    var categories: [Category] = [categoryTest]
    
    // Precisa ser Ajustada
    mutating func addCategory(nameCategory: String){
        let existingCategories = categories.map({return $0.name})
        
        for name in existingCategories {
            
            if (name == nameCategory) {
                return
            }
            
        }
        
        let category = Category(name: nameCategory)
        self.categories.append(category)
    
    }
    
    mutating func addTask(nameCategory:String, task: String){

        let category = self.categories.filter({return $0.name == nameCategory}).first
        
        guard let firstCategory = category else {
            print("Categoria inexistente")
            return
        }
        let goal = Goal(category: firstCategory, text: task)
   
        createAndSave(goal: goal)
    }
    
    mutating func showGoals(category: String){
        
        let goalsInCategory = fileInClassGoal().filter{$0.category.name == category}
        
        print("Category: \(category)")
        print(goalsInCategory.map{$0.text})
    }
    
}

        
