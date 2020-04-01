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

let directoryPaths = Directory()

//cria diretórios necessários para o armazenamento de dados
func createFiles() {
    let folderData = directoryPaths.directoryPath
    let goalsPath = directoryPaths.goalsPath.path
    
    let start = "[]"
    let dataStart = Data(start.utf8)
    
    do{
        try fileManager.createDirectory(at: folderData, withIntermediateDirectories: false, attributes: nil)

        fileManager.createFile(atPath: goalsPath, contents: dataStart, attributes: nil)
        
    }
    catch{
        return
    }
    
}

//atualiza os dados no arquivo
func refreshTasks(goals: [Goal]) -> String{
    do {
        let novoJSONdata = try JSONEncoder().encode(goals)
        let novoJSON = String(data: novoJSONdata, encoding: .utf8)
        return novoJSON!
    } catch {
        return "🤬"
        
    }
    
    
}


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

//adiciona os dados no arquivo
func writeInFile(json: String?){
    do {
        try json?.write(to: directoryPaths.goalsPath, atomically: true, encoding: .utf8)
        
    } catch {
        print(error.localizedDescription)
    }
}

//recebe um Goal, transforma em json e armazena ele em um arquivo
func createAndSave(goal: Goal){
    let json = addingTaskInFile(goal: goal)
    writeInFile(json: json)
}

//importa os dados em formato json contidos no arquivo e tranforma em array de Goals
func fileInClassGoal() -> [Goal]{
    do {
        let jsonInFileData = try Data(contentsOf: directoryPaths.goalsPath)
        let arrayClass = try JSONDecoder().decode([Goal].self, from: jsonInFileData)
        
        return arrayClass
        
    } catch  {
        let category = Category(name: "Error")
        
        return [Goal(category: category, text: "Error")]
    }

}


