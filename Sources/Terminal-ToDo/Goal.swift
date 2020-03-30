//
//  Todo.swift
//  Testes
//
//  Created by Jessica Guiot and Lucas Alves on 12/03/20.
//  Copyright © 2020 Jessica Guiot. All rights reserved.
//

import Foundation

class Goal: Codable {
    
    let category: Category
    var text: String
    var checked: Bool = false
    
    init(category: Category, text: String) {
        self.category = category
        self.text = text
    }
    
    func changeState() {
        self.checked = !self.checked
    }
    
    func editText(text: String){
        self.text = text
    }
    
}


