//
//  Todo.swift
//  Testes
//
//  Created by Jessica Guiot and Lucas Alves on 12/03/20.
//  Copyright © 2020 Jessica Guiot. All rights reserved.
//
//

import ArgumentParser
import Rainbow

//cria o arquivo e pasta pra salvar os dados
createFiles()

struct TodoParser: ParsableCommand {
    
    //seta os comandos
    static var configuration = CommandConfiguration(abstract:"Terminal To-Do List", subcommands: [AddTask.self, ShowGoals.self, Check.self, ShowAll.self, Remove.self])
    
    //argumento global nome da categoria
    struct Args: ParsableArguments {
        @Argument(help: "Category")
        var category: String
    }
    
}

extension TodoParser {
    //adiciona categoria e tasks
    struct AddTask: ParsableCommand {
        
        //adiciona descrição do subcomando
        static var configuration
        = CommandConfiguration(abstract: "Adicionar uma tarefa a uma categoria.")
        
        @OptionGroup()
        var args: TodoParser.Args
        
        @Argument()
        var task: String
        
        func run() {
            
            var todo = Todo()
            todo.addTask(nameCategory: args.category, task: task)

            print("")

        }
        
    }
    
    //Mostra a lista de determinada categoria
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
    
    //marca task como feita
    struct Check: ParsableCommand {
        static var configuration = CommandConfiguration(abstract: "Marcar task como feita.")
        
        @OptionGroup()
        var args: TodoParser.Args
        
        @Argument()
        var task: Int
        
        func run(){
            
            let existingGoals = fileInClassGoal()
            let goalsOfCategory = existingGoals.filter {$0.category.name == args.category}
            let otherGoalsOfCategory = existingGoals.filter {$0.category.name != args.category}
            
            goalsOfCategory[task].changeState()
            
            let allGoalsCategory = otherGoalsOfCategory + goalsOfCategory
            
            let json = refreshTasks(goals: allGoalsCategory)
            writeInFile(json: json)
        }
    }
        //mostra todas as categorias e suas tasks
        struct ShowAll: ParsableCommand {
            static var configuration = CommandConfiguration(abstract: "Mostrar todas as tasks.")
            
            func run(){
                let existingGoals = fileInClassGoal()
                let existingCategory = existingGoals.map{$0.category.name}
                let groupCategory = Set(existingCategory)
                
                
                var todo = Todo()
                for category in groupCategory {
                    todo.showGoals(category: category)
                }
                
                print("")
            }
        }
    
        struct Remove: ParsableCommand {
                   static var configuration = CommandConfiguration(abstract: "Remover task.")
            
                @OptionGroup()
                var args: TodoParser.Args
                   
                @Argument()
                var task: Int
            
                func run(){
                    let existingGoals = fileInClassGoal()
                    
                    var categories = existingGoals.filter{$0.category.name == args.category}
                    let othersCategories = existingGoals.filter{$0.category.name != args.category}
                    
                    categories.remove(at: task)
                    
                    let refreshCategories = categories + othersCategories
                    
                    let json = refreshTasks(goals: refreshCategories)
                    writeInFile(json: json)
                    
                    print("Task foi removida com sucesso.")
                    
            }
        }

}
    


TodoParser.main()

