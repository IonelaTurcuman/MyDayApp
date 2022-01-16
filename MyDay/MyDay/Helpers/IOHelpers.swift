//
//  IOHelpers.swift
//  MyDay
//
//  Created by Ionela Turcuman on 13.01.2022.
//

import Foundation

class IOHelpers {
    
    static func writeData(data: String) {
        let DocumentDirURL = try!
            FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        let fileURL = DocumentDirURL.appendingPathComponent(Constants.FILE_TASKS_DATA)

        do {
            try data.write(to: fileURL, atomically: true, encoding: .utf8)
        } catch {
            print("[IOHelpers] Failed to write data: \(error)")
        }
    }
    
    static func writeToJson(jsonObject: TasksModel) {
        let jsonEncoder = JSONEncoder()
        do {
            let jsonData = try jsonEncoder.encode(jsonObject)
            let jsonString = String(data: jsonData, encoding: .utf8)
            
            writeData(data: jsonString!)
        }
        catch {
            print("[IOHelpers] Failed to save data: \(error)")
        }
    }
    
    static func readFile() -> String {
        let DocumentDirURL = try!
            FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        let fileURL = DocumentDirURL.appendingPathComponent(Constants.FILE_TASKS_DATA)
        
        do {
            let data = try String(contentsOf: fileURL, encoding: .utf8)
            return data
        }
        catch {
            print("[IOHelpers] Failed to read data: \(error)")
            return ""
        }
    }
    
    static func readFromJson() -> TasksModel {
        let data = readFile().data(using: .utf8)!

        let decoder = JSONDecoder()
        guard let dataRead = try? decoder.decode(TasksModel.self, from: data) else {
            return TasksModel()
        }
        
        return dataRead
    }
}
