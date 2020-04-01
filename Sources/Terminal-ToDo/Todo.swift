//
//  Todo.swift
//  Testes
//
//  Created by Jessica Guiot and Lucas Alves on 12/03/20.
//  Copyright © 2020 Jessica Guiot. All rights reserved.
//

import Foundation

struct Todo {
    
    var goals: [Goal] = []
    var categories: [Category] = []
    
    //cria uma nova categoria
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
    //verifica se a categoria ja existe, se exitir ela adiciona a task a ela, se nao existir, ela cria uma nova categoria e adiciona a task a ela
    mutating func addTask(nameCategory:String, task: String){

        let categories = self.categories.filter({return $0.name == nameCategory})
        
        let category = categories.first
        
        guard let firstCategory = category else {
            addCategory(nameCategory: nameCategory)
            addTask(nameCategory: nameCategory, task: task)
            return
        }
        
        let goal = Goal(category: firstCategory, text: task)
        let goalsInCategory = fileInClassGoal().filter{$0.category.name == nameCategory}
        
        print("")
        print(goal.stringTemplate(index: goalsInCategory.count))

        createAndSave(goal: goal)
    }
    
    //mostra as tasks de determinada Categoria
    mutating func showGoals(category: String){
        let titleCategory = category.bold.underline
        let goalsInCategory = fileInClassGoal().filter{$0.category.name == category}
        
        print("\n   \(titleCategory):")
        for i in 0..<goalsInCategory.count {
            print(goalsInCategory[i].stringTemplate(index: i))
        }
    
        
            
    }
}
    

        
