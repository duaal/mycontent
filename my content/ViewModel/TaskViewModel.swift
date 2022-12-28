//
//  TaskViewModel.swift
//  my content
//
//  Created by duaa mohammed on 12/12/2022.
//

import SwiftUI

class taskViewModel:ObservableObject{

    //current week dates
    @Published var currentWeek :[Date] = []
    @Published var currentDay :Date = Date()
    init(){
        fetchCurrentWeek()
    }

    func fetchCurrentWeek () {
        let today = Date()
        let calender = Calendar.current
        let week = calender.dateInterval(of: .weekOfMonth, for: today)
        
        guard let firstWeekDay = week?.start else
        {
            return
        }
        (1...7).forEach{day in
            
            if  let weekday = calender.date(byAdding: .day, value: day , to:firstWeekDay){
                currentWeek.append(weekday)
                
            }
        }
    }
    func extractDate (date:Date , format :String)-> String{
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: date)
    }
    func isToday (date:Date)->Bool{
        let calender = Calendar.current
        return calender.isDate(currentDay, inSameDayAs: date)
    }
    func isCurrenHour (date:Date)-> Bool{
        let calender = Calendar.current
        let hour = calender.component(.hour, from: date)
        let currenHour = calender.component(.hour, from: Date())
        return hour == currenHour
    }
}
