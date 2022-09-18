//
//  HolidayCell.swift
//  assignment3-calendar-final
//
//  Created by Parinya Termkasipanich on 18/9/2565 BE.
//

import UIKit

class HolidayCell: UITableViewCell {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var NameLabel: UILabel!
    
    func config(date:String,name:String) {
        dateLabel.text = date
        NameLabel.text = name
    }
}
