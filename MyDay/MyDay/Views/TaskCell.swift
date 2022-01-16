//
//  TaskCell.swift
//  MyDay
//
//  Created by Ionela Turcuman on 10.01.2022.
//

import UIKit

class TaskCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var statusLabel: UILabel!
    
    @IBOutlet weak var deleteButton: UIButton!
    
    var type: String = Constants.TASK_DEFAULT
    
    var UID: String = Constants.TASK_DEFAULT
    
    func configureCell() {
        self.contentView.layer.cornerRadius = 10
        self.contentView.backgroundColor = Constants.COLOR_TASK_DEFAULT
        
        if statusLabel.text == Constants.TASK_STATUS_TODO {
            self.contentView.backgroundColor = Constants.COLOR_TASK_TODO
        } else if statusLabel.text == Constants.TASK_STATUS_DONE {
            self.contentView.backgroundColor = Constants.COLOR_TASK_DONE
        } else if statusLabel.text == Constants.TASK_STATUS_DROPPED {
            self.contentView.backgroundColor = Constants.COLOR_TASK_DROPPED
        }
        
        if type == Constants.TASK_TYPE_RUN {
            self.imageView.image = UIImage(named: Constants.TASK_TYPE_RUN.lowercased())
        } else if type == Constants.TASK_TYPE_GYM {
            self.imageView.image = UIImage(named: Constants.TASK_TYPE_GYM.lowercased())
        } else if type == Constants.TASK_TYPE_WATER {
            self.imageView.image = UIImage(named: Constants.TASK_TYPE_WATER.lowercased())
        } else if type == Constants.TASK_TYPE_NOSUGAR {
            self.imageView.image = UIImage(named: Constants.TASK_TYPE_NOSUGAR.lowercased())
        } else if type == Constants.TASK_TYPE_READ {
            self.imageView.image = UIImage(named: Constants.TASK_TYPE_READ.lowercased())
        } else if type == Constants.TASK_TYPE_MEDITATE {
            self.imageView.image = UIImage(named: Constants.TASK_TYPE_MEDITATE.lowercased())
        }
    }
    
    @IBAction func deleteButtonPressed(_ sender: Any) {
        let nc = NotificationCenter.default
        nc.post(name: NSNotification.Name(rawValue: Constants.NOTIFICATION_DELETE_TASK),
                object: nil, userInfo: ["UID": UID])
    }
    
    func tappedAnimation() {
        isUserInteractionEnabled = false
        UIView.animate(withDuration: 0.1, delay: 0,
                        options: .curveLinear, animations: { [weak self] in
                            self?.transform = CGAffineTransform.init(scaleX: 0.9, y: 0.9)
        }) { (done) in
            UIView.animate(withDuration: 0.1,delay: 0,
                            options: .curveLinear, animations: { [weak self] in
                            self?.transform = CGAffineTransform.init(scaleX: 1, y: 1)
            }) { [weak self] (_) in
                    self?.isUserInteractionEnabled = true
                }
        }
    }
    
    func setToDoStatus() {
        self.contentView.backgroundColor = Constants.COLOR_TASK_TODO
        self.statusLabel.text = Constants.TASK_STATUS_TODO
    }
    
    func setDoneStatus() {
        self.contentView.backgroundColor = Constants.COLOR_TASK_DONE
        self.statusLabel.text = Constants.TASK_STATUS_DONE
    }
    
    func setDroppedStatus() {
        self.contentView.backgroundColor = Constants.COLOR_TASK_DROPPED
        self.statusLabel.text = Constants.TASK_STATUS_DROPPED
    }

}
