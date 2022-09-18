//
//  ModalViewController.swift
//  assignment3-calendar-final
//
//  Created by Parinya Termkasipanich on 18/9/2565 BE.
//

import UIKit

class ModalViewController: UIViewController {
    
    var dateSelect:String = ""
    var languageSelect:Int = 0

    @IBOutlet weak var zodiacDate: UILabel!
    @IBOutlet weak var zodiacName: UILabel!
    @IBOutlet weak var zodiacImage: UIImageView!
    @IBOutlet weak var zodiacDescription: UITextView!
    
    @IBAction func CloseModal(_ sender: Any) {
        self.dismiss(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showZodiac()

        // Do any additional setup after loading the view.
    }
    
    func findZodiac() -> Int? {
        for (index,element) in zodiac_config.enumerated() {
            if CalendarHelper().compareDate(nowDate: dateSelect, startDate: element["startDate"]![0], endDate: element["endDate"]![0]) == true {
                return index
            }
        }
        return nil
    }
    
    func showZodiac() {
        if let index = findZodiac() {
            zodiacDate.text = CalendarHelper().dayMonthYearString(lang: languageSelect, date: dateSelect)
            zodiacImage.image = UIImage(named: "\(index).jpeg")
            zodiacName.text = zodiac_config[index]["name"]![languageSelect]
            zodiacDescription.text = zodiac_config[index]["description"]![languageSelect]
        }
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
