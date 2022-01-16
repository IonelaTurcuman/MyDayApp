//
//  Constants.swift
//  MyDay
//
//  Created by Ionela Turcuman on 10.01.2022.
//

import UIKit

class Constants {
    
    static let TASK_CELL_IDENTIFIER: String = "TaskCell"
    static let DATE_VIEWCONTROLLER_IDENTIFIER: String = "DateViewController"
    static let ADD_TASK_VIEWCONTROLLER_IDENTIFIER: String = "AddTaskViewController"
    
    static let TASK_DEFAULT: String = "DEFAULT"
    static let DATE_MONTH_DEFAULT: String = "DEFAULT"
    static let DATE_CURRENT_DEFAULT: String = "DEFAULT"
    
    static let TASK_STATUS_TODO: String = "TO DO"
    static let TASK_STATUS_DONE: String = "DONE"
    static let TASK_STATUS_DROPPED: String = "DROPPED"
    
    static let TASK_TYPE_RUN: String = "RUN"
    static let TASK_TYPE_GYM: String = "GYM"
    static let TASK_TYPE_WATER: String = "WATER"
    static let TASK_TYPE_NOSUGAR: String = "NOSUGAR"
    static let TASK_TYPE_READ: String = "READ"
    static let TASK_TYPE_MEDITATE: String = "MEDITATE"
    
    static let DATE_DEFAULT: String = "1 JANUARY 2022"
    
    static let NOTIFICATION_ADD_TASK: String = "ADD_TASK"
    static let NOTIFICATION_DELETE_TASK: String = "DELETE_TASK"
    
    static let COLOR_TASK_DEFAULT = UIColor(red: 226/255, green: 243/255, blue: 248/255, alpha: 1)
    static let COLOR_TASK_TODO = UIColor(red: 253/255, green: 229/255, blue: 76/255, alpha: 1)
    static let COLOR_TASK_DONE = UIColor(red: 88/255, green: 202/255, blue: 105/255, alpha: 1)
    static let COLOR_TASK_DROPPED = UIColor(red: 241/255, green: 146/255, blue: 38/255, alpha: 1)
    
    static let COLOR_BUTTON_ADD = UIColor(red: 49/255, green: 130/255, blue: 229/255, alpha: 1)
    static let COLOR_TYPE_SELECTED = UIColor(red: 196/255, green: 44/255, blue: 28/255, alpha: 1)
    static let COLOR_TYPE_UNSELECTED = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
    
    static let FILE_TASKS_DATA = "tasks_data001.json"
}
