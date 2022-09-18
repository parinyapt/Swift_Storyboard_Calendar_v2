//
//  weekDayCell.swift
//  assignment3-calendar-final
//
//  Created by Parinya Termkasipanich on 18/9/2565 BE.
//

import UIKit

class weekDayCell: UICollectionViewCell {
    
    @IBOutlet weak var weekDayLabel: UILabel!
    
    func config(data:String) {
        weekDayLabel.text = data
    }
}
