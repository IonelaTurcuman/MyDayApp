//
//  TaskView.swift
//  MyDay
//
//  Created by Ionela Turcuman on 12.01.2022.
//

import UIKit

class TaskView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func configurePopup(button: UIButton, label: UILabel) {
        self.layer.cornerRadius = 20
        self.backgroundColor = UIColor.white
        
        button.layer.cornerRadius = 10
        button.backgroundColor = Constants.COLOR_BUTTON_ADD
        
        label.isHidden = true
    }
    
    func shake(label: UILabel) {
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        animation.duration = 0.6
        animation.values = [-20.0, 20.0, -20.0, 20.0, -10.0, 10.0, -5.0, 5.0, 0.0 ]
        label.layer.add(animation, forKey: "shake")
    }

}
