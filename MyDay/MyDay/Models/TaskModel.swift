//
//  TaskModel.swift
//  MyDay
//
//  Created by Ionela Turcuman on 10.01.2022.
//

import Foundation

class TaskModel: Codable {
    
    var type: String
    var name: String
    var status: String
    var date: String
    var UID: String

    init() {
        self.type = Constants.TASK_TYPE_RUN
        self.name = Constants.TASK_DEFAULT
        self.status = Constants.TASK_STATUS_TODO
        self.date = Constants.TASK_DEFAULT
        self.UID = Constants.TASK_DEFAULT
    }
    
    func randomString(length: Int) -> String {
      let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
      return String((0..<length).map{ _ in letters.randomElement()! })
    }
}
