//
//  File.swift
//  
//
//  Created by Jessica Guiot on 31/03/20.
//

import Foundation

struct Directory {
    let directoryPath :URL
    let goalsPath :URL
    let categoryPath :URL
    
    init(){
        let directoryDocuments = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first
        
        self.directoryPath = directoryDocuments!.appendingPathComponent("toDoTerminalData", isDirectory: true)
        self.goalsPath = self.directoryPath.appendingPathComponent("goals.json")
        self.categoryPath = self.directoryPath.appendingPathComponent("category.json")
        
    }
}
