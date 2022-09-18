//
//  ViewController.swift
//  assignment3-calendar-final
//
//  Created by Parinya Termkasipanich on 17/9/2565 BE.
//

import UIKit

class ViewController: UIViewController {
    
    var language_select:Int = 0
    var date_select:Date = Date()
    
    var date_array:Array = [String]()
    var holiday_highlight_array:Array = [Int]()
    var holiday_detail_array:Array = [[String:String]]()
    var holiday_array:[Int:[String:[String:String]]] = [0:[:],1:[:]]

    @IBOutlet weak var weekDayView: UICollectionView!
    @IBOutlet weak var DateView: UICollectionView!
    @IBOutlet weak var HolidayView: UITableView!
    @IBOutlet weak var monthYearLabel: UILabel!
    
    @IBAction func changeLanguage(_ sender: Any) {
        let s:UISegmentedControl = sender as! UISegmentedControl
        language_select = s.selectedSegmentIndex
        setupDateInMonth()
        weekDayView.reloadData()
        getHoliday()
    }
    
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
        
        HolidayView.dataSource = self
        HolidayView.delegate = self
        
        //setup date in month
        setupDateInMonth()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        getHoliday()
    }
    
    func getHoliday() {
        if self.holiday_array[self.language_select]!.count == 0 {
            CalendarHelper().reqHolidayData(lang:language_select,completion: { data in
                self.holiday_array[self.language_select] = data
            })
            sleep(3)
        }
        showHoliday()
    }
    
    func showHoliday() {
        holiday_highlight_array.removeAll()
        holiday_detail_array.removeAll()
        
        for (index, element) in date_array.enumerated() {
            let date = (CalendarHelper().monthYearNumber(date: date_select)+element)
            if holiday_array[language_select]![date] != nil {
                holiday_highlight_array.append(index)
                let array = [
                    "date":element,
                    "name":holiday_array[language_select]![date]!["name"]!,
                    "description":holiday_array[language_select]![date]!["description"]!
                ]
                holiday_detail_array.append(array)
            }
        }
        DateView.reloadData()
        HolidayView.reloadData()
    }
    
    func setupDateInMonth() {
        date_array.removeAll()
        
        for _ in 0..<(CalendarHelper().firstDateWeekDay(date: date_select) - 1) {
            date_array.append("")
        }
        
        for i in 1...(CalendarHelper().numberOfDateInMonth(date: date_select)) {
            date_array.append(String(i))
        }
        
        monthYearLabel.text = CalendarHelper().monthYearString(lang:language_select,date: date_select)
        
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
            cell.config(data: "\(CalendarHelper().shortWeekDayName(lang:language_select,number: indexPath.item))")
            
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

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        print(date_array[indexPath.item])
        if date_array[indexPath.item] != "" {
            guard let ModalVC = storyboard?.instantiateViewController(withIdentifier: "ModalViewController") as? ModalViewController else {return}
            ModalVC.dateSelect = "\(CalendarHelper().monthYearNumber(date: date_select))\(date_array[indexPath.item])"
            ModalVC.languageSelect = language_select
            
            present(ModalVC, animated: true)
            
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return holiday_highlight_array.count
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = HolidayView.dequeueReusableCell(withIdentifier: "HolidayCell_ID", for: indexPath) as! HolidayCell
        cell.config(date: holiday_detail_array[indexPath.item]["date"]!, name: holiday_detail_array[indexPath.item]["name"]!)

        return cell
    }
}
