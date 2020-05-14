//
//  Todo.swift
//  Testes
//
//  Created by Jessica Guiot and Lucas Alves on 12/03/20.
//  Copyright © 2020 Jessica Guiot. All rights reserved.
//

import Foundation

struct Category: Codable {
    
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    mutating func editCategory(name: String) {
        self.name = name
    }
    
    func categoryTemplate(){
        let titleCategory = category.bold.underline
        let goalsInCategory = fileInClassGoal().filter{$0.category.name == category}
    }
    
}
