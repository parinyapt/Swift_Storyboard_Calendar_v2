//
//  ViewController.swift
//  assignment3-calendar-final
//
//  Created by Parinya Termkasipanich on 17/9/2565 BE.
//

import UIKit

class ViewController: UIViewController {
    
    var language_select:String = "en_US"
    var date_select:Date = Date()
    
    var date_array:Array = [String]()
    var holiday_highlight_array:Array = [Int]()
    var holiday_array:Dictionary = [String:[String:String]]()

    @IBOutlet weak var weekDayView: UICollectionView!
    @IBOutlet weak var DateView: UICollectionView!
    
    @IBOutlet weak var monthYearLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //setup week day view
        weekDayView.dataSource = self
        weekDayView.delegate = self
        weekDayView.collectionViewLayout = UICollectionViewFlowLayout()
        
        //setup date day view
        DateView.dataSource = self
        DateView.delegate = self
        DateView.collectionViewLayout = UICollectionViewFlowLayout()
        
        //setup date in month
        setupDateInMonth()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        getHoliday()
    }
    
    func getHoliday() {
        CalendarHelper().reqHolidayData(completion: { data in
            self.holiday_array = data
        })
        sleep(3)
        showHoliday()
    }
    
    func showHoliday() {
        holiday_highlight_array.removeAll()
        
        for (index, element) in date_array.enumerated() {
            if holiday_array[(CalendarHelper().monthYearNumber(date: date_select)+element)] != nil {
                holiday_highlight_array.append(index)
            }
        }
        DateView.reloadData()
    }
    
    func setupDateInMonth() {
        date_array.removeAll()
        
        for _ in 0..<(CalendarHelper().firstDateWeekDay(date: date_select) - 1) {
            date_array.append("")
        }
        
        for i in 1...(CalendarHelper().numberOfDateInMonth(date: date_select)) {
            date_array.append(String(i))
        }
        
        monthYearLabel.text = CalendarHelper().monthYearString(date: date_select)
        
        if(holiday_array.count > 0){
            showHoliday()
        }
        
        DateView.reloadData()
    }
    

    //btn action previous month
    @IBAction func previousMonth(_ sender: Any) {
        //minus month with func
        date_select = CalendarHelper().minusMonth(date: date_select)
        setupDateInMonth()
    }
    
    //btn action next month
    @IBAction func nextMonth(_ sender: Any) {
        //plus month with func
        date_select = CalendarHelper().plusMonth(date: date_select)
        setupDateInMonth()
    }
    
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.weekDayView {
            return 7
        }
        
        return date_array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.weekDayView {
            let cell = weekDayView.dequeueReusableCell(withReuseIdentifier: "weekDayCellID", for: indexPath) as! weekDayCell
            cell.config(data: "\(CalendarHelper().shortWeekDayName(number: indexPath.item))")
            
            return cell
        } else {
            let cell = DateView.dequeueReusableCell(withReuseIdentifier: "DateCell_ID", for: indexPath) as! DateCell
            cell.config(data: date_array[indexPath.item])
            if holiday_highlight_array.contains(indexPath.item) {
                cell.highlight(mode:"set")
            }else {
                cell.highlight(mode:"unset")
            }
            
            return cell
        }
        
        
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var width:CGFloat
        var height:CGFloat
        
        if collectionView == self.weekDayView {
            width = (collectionView.frame.size.width - 2) / 9
            height = (collectionView.frame.size.height) / 6
        }else {
            width = (collectionView.frame.size.width - 2) / 9
            height = (collectionView.frame.size.height) / 11
        }
        
        return CGSize(width: width, height: height)
    }
}
