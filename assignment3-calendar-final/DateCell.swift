//
//  DateCell.swift
//  assignment3-calendar-final
//
//  Created by Parinya Termkasipanich on 18/9/2565 BE.
//

import UIKit

class DateCell: UICollectionViewCell {
    
    @IBOutlet weak var DateLabel: UILabel!
    
    func config(data:String) {
        DateLabel.text = data
    }
    
    func highlight(mode:String){
        if mode == "set"{
            DateLabel.textColor = UIColor.red
        }else{
            DateLabel.textColor = UIColor.black
        }
        
    }
}
