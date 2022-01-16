//
//  DayViewController.swift
//  MyDay
//
//  Created by Ionela Turcuman on 10.01.2022.
//

import UIKit

class DateViewController: UIViewController, UICollectionViewDataSource,
                          UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var dateView: UIView!
    
    @IBOutlet weak var addTaskButton: UIButton!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    var todayTasksModel = TasksModel()
    
    var allTasksModel = TasksModel()
    
    var currentDate: String = Constants.DATE_DEFAULT
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
        
        self.configureCurrentDate()
        
        self.setCurrentTasks()
        
        let addTask = NotificationCenter.default
        addTask.addObserver(self, selector: #selector(addTaskPostit),
                          name: NSNotification.Name(rawValue: Constants.NOTIFICATION_ADD_TASK),
                          object: nil)
        
        let deleteTask = NotificationCenter.default
        deleteTask.addObserver(self, selector: #selector(deleteTaskPostit),
                          name: NSNotification.Name(rawValue: Constants.NOTIFICATION_DELETE_TASK),
                          object: nil)
    }
    
    @IBAction func addTaskButtonPressed(_ sender: Any) {
        let popupViewController =
        storyboard?.instantiateViewController(withIdentifier: Constants.ADD_TASK_VIEWCONTROLLER_IDENTIFIER)
        as? AddTaskViewController
        
        popupViewController?.currentDate = currentDate
        
        if popupViewController != nil {
            present(popupViewController!, animated: true, completion: nil)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView
            .dequeueReusableCell(withReuseIdentifier: Constants.TASK_CELL_IDENTIFIER, for: indexPath)
            as! TaskCell
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let currentCell = cell as? TaskCell
        
        let currentTaskModel = todayTasksModel.tasksModels[indexPath.row]
        currentCell?.nameLabel.text = currentTaskModel.name
        currentCell?.statusLabel.text = currentTaskModel.status
        currentCell?.type = currentTaskModel.type
        currentCell?.UID = currentTaskModel.UID
        
        currentCell?.configureCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let currentCell =
            collectionView.cellForItem(at: indexPath) as? TaskCell
        
        for i in 0...allTasksModel.tasksModels.count-1 {
            let currentTask = allTasksModel.tasksModels[i]
            if currentTask.UID == currentCell?.UID {
                currentCell?.tappedAnimation()
                if currentTask.status == Constants.TASK_STATUS_TODO {
                    currentCell?.setDoneStatus()
                    allTasksModel.tasksModels[i].status = Constants.TASK_STATUS_DONE
                } else if currentTask.status == Constants.TASK_STATUS_DONE {
                    currentCell?.setDroppedStatus()
                    allTasksModel.tasksModels[i].status = Constants.TASK_STATUS_DROPPED
                } else {
                    currentCell?.setToDoStatus()
                    allTasksModel.tasksModels[i].status = Constants.TASK_STATUS_TODO
                }
                
                IOHelpers.writeToJson(jsonObject: allTasksModel)
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return todayTasksModel.tasksModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let noOfCellsInRow = 3

        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout

        let totalSpace = flowLayout.sectionInset.left
            + flowLayout.sectionInset.right
            + (flowLayout.minimumInteritemSpacing * CGFloat(noOfCellsInRow - 1))

        let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(noOfCellsInRow))

        return CGSize(width: size, height: size + size/2)
    }
    
    func configureCurrentDate() {
        dateLabel.text = currentDate
    }
    
    func setCurrentTasks() {
        allTasksModel = IOHelpers.readFromJson()
        for task in allTasksModel.tasksModels {
            if task.date == currentDate {
                todayTasksModel.tasksModels.append(task)
            }
        }
    }
    
    @objc func addTaskPostit(notification: NSNotification) {
        let task = notification.object as! TaskModel
        
        allTasksModel.tasksModels.append(task)
        todayTasksModel.tasksModels.append(task)

        DispatchQueue.global(qos: .background).async {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    @objc func deleteTaskPostit(notification: NSNotification) {
        let taskUID = notification.userInfo as! Dictionary<String, String>
        
        for i in 0...allTasksModel.tasksModels.count-1 {
            let currentTask = allTasksModel.tasksModels[i]
            if  currentTask.UID == taskUID["UID"] {
                allTasksModel.tasksModels.remove(at: i)
                break
            }
        }
        
        for i in 0...todayTasksModel.tasksModels.count-1 {
            let currentTask = todayTasksModel.tasksModels[i]
            if  currentTask.UID == taskUID["UID"] {
                todayTasksModel.tasksModels.remove(at: i)
                break
            }
        }

        IOHelpers.writeToJson(jsonObject: allTasksModel)
        DispatchQueue.global(qos: .background).async {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }

}
