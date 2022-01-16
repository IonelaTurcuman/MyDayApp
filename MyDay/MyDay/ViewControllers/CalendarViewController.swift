//
//  CalendarViewController.swift
//  MyDay
//
//  Created by Ionela Turcuman on 06.01.2022.
//

import UIKit
import FSCalendar

class CalendarViewController: UIViewController, FSCalendarDelegate {

    @IBOutlet weak var calendarView: FSCalendar!
    
    let dateModel: DateModel = DateModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        calendarView.delegate = self
    }
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        let currentDate = date.description(with: .current)
        
        if dateModel.parseDate(dateString: currentDate) == false {
            print("[CalendarViewController] Could not parse current date.")
            return
        }
        
        openSelectedDatePage(currentDate: dateModel.currentDate)
    }
    
    func openSelectedDatePage(currentDate: String) {
        let popupViewController =
        storyboard?.instantiateViewController(withIdentifier: Constants.DATE_VIEWCONTROLLER_IDENTIFIER)
        as? DateViewController
        
        popupViewController?.currentDate = currentDate
        
        if popupViewController != nil {
            present(popupViewController!, animated: true, completion: nil)
        }
    }

}
