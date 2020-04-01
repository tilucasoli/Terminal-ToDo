//
//  File.swift
//  
//
//  Created by Jessica Guiot on 31/03/20.
//

import Foundation

//struct necessária para armazenar URLs de onde serão salvos os arquivos
struct Directory {
    let directoryPath :URL
    let goalsPath :URL
    
    init(){
        let directoryDocuments = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first
        
        self.directoryPath = directoryDocuments!.appendingPathComponent("toDoTerminalData", isDirectory: true)
        self.goalsPath = self.directoryPath.appendingPathComponent("goals.json")

    }
}
