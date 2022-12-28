//
//  Chart.swift
//  SimpleTodo
//
//  Created by Njoud saud Al-Najem on 27/05/1444 AH.
//

import SwiftUI


struct Chart_Previews: PreviewProvider {
    static var previews: some View {
        Chart()
    }
}

struct Chart : View{
    var body: some View{
        
        VStack{
            
            ZStack{
                Text("My Analytic for december")
                .fontWeight(.bold)
            }.padding(.top , UIApplication.shared.windows.first?.safeAreaInsets.top)
                .padding()
 
            
            
            
            GeometryReader{ g in
                ZStack{
                    ForEach(0..<data.count){i in
                        PieShape(center: CGPoint(x: g.frame(in: .global).width/2, y: g.frame(in: .global).height/2), index: i)
                    }
                }
            }.frame(height: 360)
                .padding(.top,20)
                .clipShape(Circle())
                .shadow(radius: 8)
            VStack{
                
                ForEach(data){i in
                    
                    HStack{
                        Text(i.name)
                            .frame(width: 100)
                        GeometryReader{g in
                            
                            HStack{
                                Spacer(minLength: 0)
Rectangle()
                                
                                    .fill(i.color)
                                    .frame(width : self.calwidth(width: g.frame(in: .global).width, value: i.percent),height: 10)
                                Text(String(format: "\(i.percent)","%.0f")).fontWeight(.bold)
                                    .padding(.leading , 10)
                            }
                            
                        }
                    }
                    .padding(.top,18)
                }
            }
            .padding()
            Spacer()
        }.edgesIgnoringSafeArea(.top)
        
    }
    func calwidth(width: CGFloat,value : CGFloat)->CGFloat{
        let temp = value / 100
        return temp * width
    }
}



struct PieShape : View {
    
    var center : CGPoint
    var index : Int
    var body: some View{
        
        Path{path in
            path.move(to: self.center)
            path.addArc(center: self.center, radius: 180, startAngle: .init(degrees: self.from()), endAngle: .init(degrees: self.to()), clockwise: false)
        }.fill(data[index].color)
    }
    func from()->Double{
        if index == 0{
            return 0
        }else{  var temp : Double = 0
            for i in 0...index-1{
             temp += Double(data[i].percent / 100) * 360
            }
            return temp
            
        }
        
      
    }
    
    
    
    func to()->Double{
        
        var temp : Double = 0
        for i in 0...index{
         temp += Double(data[i].percent / 100) * 360
        }
        return temp
    }
}







// New
struct Pie : Identifiable{
    
var id:Int
var percent : CGFloat
var name : String
var color: Color
    
}



var data = [

    Pie(id: 0, percent: 17, name: "TikTok", color: Color("Accents")),
    Pie(id: 1, percent: 21, name: "YouTube", color: Color("lightblue")),
    Pie(id: 2, percent: 35, name: "Instgram", color: Color("taskColor")),
    Pie(id: 3, percent: 27, name: "Other", color: Color("gray")),


]

