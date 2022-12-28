//
//  CustomeDatePicker.swift
//  my content
//
//  Created by duaa mohammed on 16/12/2022.
//

import SwiftUI

struct CustomeDatePicker: View {
    @Binding var currentDate: Date
    // Month update on arrow button clicks...
    @State var currentMonth: Int = 0
    @State var selectedtab  = "home"
    var body: some View {
      
            VStack(spacing: 35){
                // Days...
                VStack{
                    let days: [String] = ["Sun", "Mon", "Tue", "Wed", "Thu","Fri", "Sat"]
                    HStack(spacing: 20){
                        VStack (alignment: .leading, spacing: 10){
                            Text("\(extraDate()[0]) \(extraDate()[1])")
                                .font (.title2).fontWeight(.semibold).padding(.vertical,9)
                            
                        }
                        Spacer (minLength: 0)
                        Button {
                            withAnimation{
                                currentMonth-=1
                            }
                        } label: {
                            Image (systemName: "chevron.left").font(.title2)
                        }
                        Button {
                            withAnimation{
                                currentMonth+=1
                            }
                        } label: {
                            Image (systemName: "chevron.right").font(.title2)
                        }
                    }.padding(.horizontal)
                    HStack (spacing:0){
                        ForEach( days,id: \.self) {day in
                            Text (day)
                                .font(.callout)
                                .fontWeight(.semibold)
                                .frame (maxWidth: .infinity)
                        }
                    }
                    // Lazy Grid..
                    let columns = Array (repeating: GridItem(.flexible()),
                                         count: 7)
                    LazyVGrid(columns: columns, spacing: 15) {
                        ForEach(extractDate()) {value in
                            CardView(value: value).background(
                                Capsule().fill(Color(.systemPink)).padding(.horizontal,8).opacity(isSameDay(date1: value.date, date2: currentDate) ? 1 : 0)).onTapGesture {
                                    currentDate = value.date
                                }
                        }
                    }}.background(Color("calender")).padding(.horizontal,6).padding(.vertical,0)
                VStack(alignment: .leading){
                    NavigationLink(destination: todo(), label: {
                        HStack{
                            Image(systemName: "plus").resizable().frame(width: 20,height: 20).fontWeight(.bold).padding(5).background(Color(.orange), in: Rectangle()).foregroundColor(.white).padding(.horizontal,5).cornerRadius(10)
                            Text("Add Task").font(.system(size:18,weight: .semibold))
                        }})
                    
                    Text("MY TASKS").font (.system(size:24).bold())
                        .frame (maxWidth: .infinity, alignment:
                                .leading).padding(.horizontal,10).foregroundColor(Color("fontColor"))
                }
                VStack(spacing:20){
                    
                    if var task = tasks.first(where: {task in
                        return isSameDay(date1: task.taskDate, date2: currentDate)
                    }){
                        ForEach(task.task){task in
                            VStack(alignment: .leading, spacing: 10){
                                Text(task.time.addingTimeInterval(CGFloat.random(in: 0...5000)),style: .time)
                                HStack{
                                    Image(systemName: task.isComplet ? "checkmark.circle.fill" : "circle").resizable().frame(width: 30,height: 30).padding(.horizontal,0).padding()
                                    
                                        .onTapGesture {
                                            
                                            
                                        }
                                    Spacer()
                                    Text(task.title).font(.system(size: 18).bold()).padding(.vertical,10).padding(.horizontal,0).frame(maxWidth:.infinity,alignment: .leading)
                                    
                                    
                                    
                                    
                                }.background(Color("taskColor").cornerRadius(8)).foregroundColor(.white)
                            }
                        }
                    }else{
                        Text("No Tasks Found")
                    }
                }.padding().background(Color("taskBackground")).padding(.horizontal,6)
                TabView(selection: $selectedtab){
                    Color(.systemPink).tag("home")
                    Color(.systemPink).tag("box")
                    Color(.systemPink).tag("ball")
                    
                    Color(.systemPink).tag("mesagges")
                    
                }
                
            }.onChange(of: currentMonth){newValue in
                currentDate = getCurrentMonth()
            }
            
        }
    @ViewBuilder
    func CardView (value :DateValue)-> some View{
        VStack{
            if value.day != -1{
                if let task = tasks.first(where: { task in
                    return isSameDay (date1: task.taskDate, date2:
                                        value.date)
                }) {
                    Text("\(value.day)")
                        .font (.title3.bold()).foregroundColor(isSameDay (date1:task.taskDate, date2: currentDate) ? .white: .primary).frame (maxWidth: .infinity)
          
                    Spacer ()
                    Circle()
                        .fill(isSameDay(date1: task.taskDate,
                                   date2: currentDate) ? .white :
                                Color(.systemPink))
                    .frame(width: 8,height: 8)
                    
                }
                else{
                    Text("\(value.day)")
                        .font (.title3.bold())
                    Spacer().foregroundColor(isSameDay (date1:value.date, date2: currentDate) ? .white: .primary).frame (maxWidth: .infinity)
                }}
        }.padding(.vertical,8)
            .frame(height: 60,alignment: .top)
        
    }
    
    
    func isSameDay (date1: Date, date2: Date)->Bool{
        let calendar = Calendar.current
        return calendar.isDate( date1 , inSameDayAs: date2)
        
    }
    func getCurrentMonth()->Date{
        let calendar = Calendar.current
        // Getting Current Month Date....
        guard let currentMonth = calendar.date(byAdding: .month,
                                               value: self.currentMonth, to: Date()) else{
            return Date()
        }
        return currentMonth
        
    }
    // extrating Year And Month for display...
    func extraDate()-> [String] {
    let formatter = DateFormatter()
    formatter.dateFormat = "YYYY MMMM"
    let date = formatter.string(from: currentDate)
    return date.components (separatedBy: " ")
    }
    func extractDate()->[DateValue]{
        let calendar = Calendar.current
        // Getting Current Month Date....
        let currentMonth = getCurrentMonth()
        
       var days = currentMonth.getAllDates().compactMap { date -> DateValue
        in
        // getting day...
        let day = calendar.component(.day, from: date)
        return DateValue (day: day, date: date)
        }
        // adding offset days to get exact week day...
        let firstWeekday = calendar.component(.weekday, from:
        days.first?.date ?? Date())
        for _ in 0..<firstWeekday - 1{
        days.insert (DateValue(day: -1, date: Date()), at: 0)
        }
        return days
        
    }
    }


struct CustomeDatePicker_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
    
}
extension Date{
func getAllDates ()-> [Date] {
    let calendar = Calendar.current
    let startDate = calendar.date(from:
    Calendar.current.dateComponents([.year,.month], from:
    self))!
    let range = calendar.range (of: .day , in: .month ,for:startDate)!
    return range.compactMap { day -> Date in
        return calendar.date(byAdding: .day, value: day-1,
                              to: startDate)!
    }
    }
    
}
