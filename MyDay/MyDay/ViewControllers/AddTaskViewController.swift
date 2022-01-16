//
//  AddTaskViewController.swift
//  MyDay
//
//  Created by Ionela Turcuman on 12.01.2022.
//

import UIKit

class AddTaskViewController: UIViewController {
    
    @IBOutlet weak var taskView: TaskView!
    
    @IBOutlet weak var addButton: UIButton!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    @IBOutlet weak var runButton: UIButton!
    
    @IBOutlet weak var gymButton: UIButton!
    
    @IBOutlet weak var waterButton: UIButton!
    
    @IBOutlet weak var nosugarButton: UIButton!
    
    @IBOutlet weak var readButton: UIButton!
    
    @IBOutlet weak var meditateButton: UIButton!
    
    var task = TaskModel()
    
    var allTasksModel = TasksModel()
    
    var currentDate: String = Constants.TASK_DEFAULT
    
    override func viewDidLoad() {
        super.viewDidLoad()

        taskView.configurePopup(button: addButton, label: errorLabel)
        
        setDefaultButtons()
    }
    
    @IBAction func addButtonPressed(_ sender: Any) {
        let name = nameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        if (name == "") {
            errorLabel.isHidden = false
            taskView.shake(label: errorLabel)
            return
        }
        
        self.setTodayTasks()
        self.addNewTask(name: name)

        IOHelpers.writeToJson(jsonObject: allTasksModel)
        self.dismiss(animated: true, completion: {
            self.addTaskPostit()
        })
    }
    
    func addTaskPostit() {
        let nc = NotificationCenter.default
        nc.post(name: NSNotification.Name(rawValue: Constants.NOTIFICATION_ADD_TASK),
                object: task, userInfo: nil)
    }
    
    func addNewTask(name: String) {
        task.name = name
        task.date = currentDate
        task.UID = task.randomString(length: 20)
        
        allTasksModel.tasksModels.append(task)
    }
    
    func setTodayTasks() {
        allTasksModel = IOHelpers.readFromJson()
    }
    
    @IBAction func runButtonPressed(_ sender: Any) {
        runButton.backgroundColor = Constants.COLOR_TYPE_SELECTED
        gymButton.backgroundColor = Constants.COLOR_TYPE_UNSELECTED
        waterButton.backgroundColor = Constants.COLOR_TYPE_UNSELECTED
        nosugarButton.backgroundColor = Constants.COLOR_TYPE_UNSELECTED
        readButton.backgroundColor = Constants.COLOR_TYPE_UNSELECTED
        meditateButton.backgroundColor = Constants.COLOR_TYPE_UNSELECTED
        
        task.type = Constants.TASK_TYPE_RUN
    }
    
    @IBAction func gymButtonPressed(_ sender: Any) {
        gymButton.backgroundColor = Constants.COLOR_TYPE_SELECTED
        runButton.backgroundColor = Constants.COLOR_TYPE_UNSELECTED
        waterButton.backgroundColor = Constants.COLOR_TYPE_UNSELECTED
        nosugarButton.backgroundColor = Constants.COLOR_TYPE_UNSELECTED
        readButton.backgroundColor = Constants.COLOR_TYPE_UNSELECTED
        meditateButton.backgroundColor = Constants.COLOR_TYPE_UNSELECTED
        
        task.type = Constants.TASK_TYPE_GYM
    }
    
    @IBAction func waterButtonPressed(_ sender: Any) {
        waterButton.backgroundColor = Constants.COLOR_TYPE_SELECTED
        gymButton.backgroundColor = Constants.COLOR_TYPE_UNSELECTED
        runButton.backgroundColor = Constants.COLOR_TYPE_UNSELECTED
        nosugarButton.backgroundColor = Constants.COLOR_TYPE_UNSELECTED
        readButton.backgroundColor = Constants.COLOR_TYPE_UNSELECTED
        meditateButton.backgroundColor = Constants.COLOR_TYPE_UNSELECTED
        
        task.type = Constants.TASK_TYPE_WATER
    }
    
    
    @IBAction func nosugarButtonPressed(_ sender: Any) {
        nosugarButton.backgroundColor = Constants.COLOR_TYPE_SELECTED
        gymButton.backgroundColor = Constants.COLOR_TYPE_UNSELECTED
        waterButton.backgroundColor = Constants.COLOR_TYPE_UNSELECTED
        runButton.backgroundColor = Constants.COLOR_TYPE_UNSELECTED
        readButton.backgroundColor = Constants.COLOR_TYPE_UNSELECTED
        meditateButton.backgroundColor = Constants.COLOR_TYPE_UNSELECTED
        
        task.type = Constants.TASK_TYPE_NOSUGAR
    }
    
    
    @IBAction func readButtonPressed(_ sender: Any) {
        readButton.backgroundColor = Constants.COLOR_TYPE_SELECTED
        gymButton.backgroundColor = Constants.COLOR_TYPE_UNSELECTED
        waterButton.backgroundColor = Constants.COLOR_TYPE_UNSELECTED
        nosugarButton.backgroundColor = Constants.COLOR_TYPE_UNSELECTED
        runButton.backgroundColor = Constants.COLOR_TYPE_UNSELECTED
        meditateButton.backgroundColor = Constants.COLOR_TYPE_UNSELECTED
        
        task.type = Constants.TASK_TYPE_READ
    }
    
    @IBAction func meditateButtonPressed(_ sender: Any) {
        meditateButton.backgroundColor = Constants.COLOR_TYPE_SELECTED
        gymButton.backgroundColor = Constants.COLOR_TYPE_UNSELECTED
        waterButton.backgroundColor = Constants.COLOR_TYPE_UNSELECTED
        nosugarButton.backgroundColor = Constants.COLOR_TYPE_UNSELECTED
        readButton.backgroundColor = Constants.COLOR_TYPE_UNSELECTED
        runButton.backgroundColor = Constants.COLOR_TYPE_UNSELECTED
        
        task.type = Constants.TASK_TYPE_MEDITATE
    }
    
    func setDefaultButtons() {
        runButton.backgroundColor = Constants.COLOR_TYPE_SELECTED
    }
}
