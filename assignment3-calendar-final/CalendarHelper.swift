//
//  CalendarHelper.swift
//  assignment3-calendar-final
//
//  Created by Parinya Termkasipanich on 18/9/2565 BE.
//

import Foundation
import UIKit

class CalendarHelper {
    var calendar = Calendar(identifier: .iso8601)
    
    func shortWeekDayName(number:Int) -> String {
        calendar.locale = Locale(identifier: "en_US")
        return calendar.shortWeekdaySymbols[number]
    }
    
    func numberOfDateInMonth(date: Date) -> Int {
        let range = calendar.range(of: .day, in: .month, for: date)!
        return range.count
    }
    
    func firstDateWeekDay(date: Date) -> Int {
        let monthYear = calendar.dateComponents([.year, .month], from: date)
        let firstDateOfMonth = calendar.date(from: monthYear)!
        let dateinfo = calendar.dateComponents([.weekday], from: firstDateOfMonth)
        return dateinfo.weekday!
    }
    
    func monthYearString(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US")
        dateFormatter.dateFormat = "MMMM yyyy"
        return dateFormatter.string(from: date)
    }
    
    func monthYearNumber(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US")
        dateFormatter.dateFormat = "yyyy-MM-"
        return dateFormatter.string(from: date)
    }
    
    func plusMonth(date: Date) -> Date {
        return calendar.date(byAdding: .month, value: 1, to: date)!
    }
    
    func minusMonth(date: Date) -> Date {
        return calendar.date(byAdding: .month, value: -1, to: date)!
    }
    
    
    
    
    //request api
    
    struct resHolidayData: Codable {
        let items: [resHolidayDataItems]
    }
    struct resHolidayDataItems: Codable {
        let summary: String
        let description: String
        let start: resHolidayDataItemsStart
    }
    struct resHolidayDataItemsStart: Codable {
        let date: String
    }
    
    func reqHolidayData(completion: @escaping (([String:[String:String]]) -> Void)) {
        
        var temp_data:Dictionary = [String:[String:String]]()
        
        guard let url = URL(string: "https://www.googleapis.com/calendar/v3/calendars/en.th%23holiday%40group.v.calendar.google.com/events?key=&timeMax=2024-01-01T00:00:00Z&timeMin=2020-01-01T00:00:00Z&singleEvents=true&orderBy=startTime") else {
            return
        }
        var request = URLRequest(url: url)
        //method
        request.httpMethod = "GET"
        //header
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        //body
        request.httpBody = nil
        
        let task = URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
            if let error = error {
                print("Error with fetching: \(error)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,(200...299).contains(httpResponse.statusCode) else {
                print("Error with the response, unexpected status code: ")
                return
            }
            
            if let data = data {
                do{
                    let tasks:resHolidayData = try JSONDecoder().decode(resHolidayData.self, from: data)
                    tasks.items.forEach({ data in
                        temp_data[data.start.date] = ["name":data.summary,"description":data.description]
                    })
                    completion(temp_data)
                }catch{
                    print(error)
                }
            }
        })
        task.resume()
        
    }
    
    
}
