//
//  ViewController.swift
//  MyDay
//
//  Created by Ionela Turcuman on 06.01.2022.
//

import UIKit
import QuoteKit

class ViewController: UIViewController {
    
    @IBOutlet weak var quoteLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        getQuote()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            UIView.animate(withDuration: 0.2) {
                self.quoteLabel.alpha = 0
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                self.goToCalendarViewController()
            }
        }
    }

    func goToCalendarViewController() {
        let calendarViewController =
            self.storyboard?.instantiateViewController(identifier: "CalendarViewController")
            as? CalendarViewController
        
        self.view.window?.rootViewController = calendarViewController
        self.view.window?.makeKeyAndVisible()
    }
    
    func getQuote() {
        QuoteKit.randomQuote { result in
            do {
                let quote = try result.get()
                
                DispatchQueue.main.async {
                    self.quoteLabel.text = "\"" + quote!.content + "\"\n -" + quote!.author
                }
            } catch {
                
            }
        }
    }
}

