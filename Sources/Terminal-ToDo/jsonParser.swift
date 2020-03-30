//
//  jsonParser.swift
//  Testes
//
//  Created by Jessica Guiot on 13/03/20.
//  Copyright © 2020 Jessica Guiot. All rights reserved.
//

import Foundation

let fileManager = FileManager.default
let currentPath = fileManager.currentDirectoryPath

let categoryPath = currentPath + "category.json"
let goalsPath = currentPath + "goals.json"

func addingTaskInFile(goal: Goal) -> String {
    
    do {
        // Transforma o arquivo em JSON Data
        // Transforma o JSON Data no formato Array de Goal
        var arrayGoals = fileInClassGoal()
        
        // Acrescenta a classe Goal recebida ao Array de Goals
        arrayGoals.append(goal)
        
        // Transforma a classe Array de Goals em JSON Data
        let novoJSONdata = try JSONEncoder().encode(arrayGoals)
        
        // Transforma JSON Data em String
        let novoJSON = String(data: novoJSONdata, encoding: .utf8)
        
        return novoJSON!
        
    }
        
    catch {
        return ""
    }

}

//func addingCategoryInFile(category: Category) -> String {
//    var arrayCategories = fileInClassCategory()
//    arrayCategories.append(category)
//
//    let novoJSONdata = try JSONEncoder().encode(arrayGoals)
//
//    // Transforma JSON Data em String
//    let novoJSON = String(data: novoJSONdata, encoding: .utf8)
//
//    return novoJSON!
//
//}

func writeInFile(json: String?){
    do {
        try json?.write(to: URL(fileURLWithPath: currentPath), atomically: true, encoding: .utf8)
        
    } catch {
        print(error.localizedDescription)
    }
}

func createAndSave(goal: Goal){
    let json = addingTaskInFile(goal: goal)
    writeInFile(json: json)
}


func fileInClassGoal() -> [Goal]{
    do {
        let jsonInFileData = try Data(contentsOf: URL(fileURLWithPath: currentPath + "goal.txt"))
        let arrayClass = try JSONDecoder().decode([Goal].self, from: jsonInFileData)
        
        return arrayClass
        
    } catch  {
        let category = Category(name: "Error")
        
        return [Goal(category: category, text: "Error")]
    }

}

func fileInClassCategory() -> [Category]{
    do {
        let jsonInFileData = try Data(contentsOf: URL(fileURLWithPath: currentPath + "category.txt"))
        let arrayClass = try JSONDecoder().decode([Category].self, from: jsonInFileData)
        
        return arrayClass
        
    } catch  {
        let category = Category(name: "Error")
        
        return [category]
    }

}

func writebrackets(url: URL){
    let brackets = "[]"
    
    do {
        try brackets.write(to: url, atomically: true, encoding: .utf8)
        
    } catch {
        return

    }
    
}
