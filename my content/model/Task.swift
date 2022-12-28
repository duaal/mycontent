//
//  Task.swift
//  my content
//
//  Created by duaa mohammed on 16/12/2022.
//

import SwiftUI
struct Tasks: Identifiable{
    var id = UUID().uuidString
    var title: String
    var isComplet :Bool
    var time: Date = Date()}

struct TaskMetaData: Identifiable{
    var id = UUID().uuidString
    var task: [Tasks]
    var taskDate: Date}


func getSampleDate(offset: Int)->Date{
    let calender = Calendar.current
    
    let date = calender.date (byAdding: .day, value: offset, to: Date())
    return date ?? Date()
    
}
var tasks :[TaskMetaData] = [
    TaskMetaData(task: [
        Tasks (title: "Talk to mohammed",isComplet:false),
    Tasks (title: "iPhone 13 Great Design Change",isComplet:true),
    Tasks(title: "Nothing Much Workout !!!",isComplet:false)
    ], taskDate: getSampleDate(offset: 1)),
    TaskMetaData(task: [
    Tasks(title: "Talk to sara",isComplet:false)
    ], taskDate: getSampleDate(offset: -3)),
    TaskMetaData(task: [Tasks (title: "some title here",isComplet:true)], taskDate: Date()),
    TaskMetaData(task: [Tasks (title: "some title here",isComplet:false)], taskDate: Date()),

]
