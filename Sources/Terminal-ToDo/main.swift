//
//  Todo.swift
//  Testes
//
//  Created by Jessica Guiot and Lucas Alves on 12/03/20.
//  Copyright © 2020 Jessica Guiot. All rights reserved.
//
//Lucas

import ArgumentParser

createFiles()

struct TodoParser: ParsableCommand {
    
    static var configuration = CommandConfiguration(abstract:"Mostrar Lista", subcommands: [AddTitle.self, AddTask.self, ShowGoals.self])
    
    struct Args: ParsableArguments {
        @Argument(help: "Category")
        var category: String
    }
    
}

extension TodoParser {
    
    struct AddTitle: ParsableCommand {
        
        static var configuration
        = CommandConfiguration(abstract: "Adicionar uma categoria.")
        
        @OptionGroup()
        var args: TodoParser.Args
        
        func run() {
            var todo = Todo()
            todo.addCategory(nameCategory: args.category)
        }
        
    }
    
    struct AddTask: ParsableCommand {
        
        static var configuration
        = CommandConfiguration(abstract: "Adicionar uma tarefa a uma categoria.")
        
        @OptionGroup()
        var args: TodoParser.Args
        
        @Argument()
        var task: String
        
        func run() {
            
            var todo = Todo()
            todo.addTask(nameCategory: args.category, task: task)

            print("Item Adicionado")

        }
        
    }
    
    struct ShowGoals: ParsableCommand {
        
        static var configuration
        = CommandConfiguration(abstract: "Mostrar todas as tasks dentro da categoria.")
        
        @OptionGroup()
        var args: TodoParser.Args
        
        func run() {
            
            var todo = Todo()
            todo.showGoals(category: args.category)
            
        }
        
    }
    
}

TodoParser.main()
