//
//  DatePicker.swift
//  UICollection
//
//  Created by Devansh Mohata on 08/09/22.
//

import UIKit

class DatePicker: UIViewController {

    @IBOutlet weak var datePickr: UIDatePicker!
    @IBOutlet weak var uiLabel: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        datePickr.date = Date()
        datePickr.locale = .current
        datePickr.addTarget(self, action: #selector(dateChanged), for: .valueChanged)
//        datePickr.datePickerStyle ---- Gets Current Style of Date Picker
        datePickr.datePickerMode = .dateAndTime
        
    }
    
    @IBAction func onSelect(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            datePickr.preferredDatePickerStyle = .compact
        case 1:
            datePickr.preferredDatePickerStyle = .inline
        case 2:
            datePickr.preferredDatePickerStyle = .wheels
        default:
            break
        }
        
    }
    
    @objc func dateChanged(){
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        uiLabel.text = dateFormatter.string(from: datePickr.date)
    }
    
}
