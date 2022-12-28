//
//  screen3.swift
//  my content
//
//  Created by duaa mohammed on 21/12/2022.
//

import SwiftUI

struct screen3: View {
    @State var isPressed2 = false

    var body: some View {
        VStack {
            Spacer()
            Button(action:{}){Text("Skip")}
            .foregroundColor(Color("taskColor"))
            .bold()
            .padding(.leading, 300.0)
            
            
            VStack{
               Spacer()
                Image("sc3")
                
                .resizable()
                .frame(width: 450, height: 350)
              
            Text("Get task analytics")
            .foregroundColor(Color("taskColor"))
                    .font(.title2)
                    .bold()
                  
              
               Spacer()
              
               
                HStack{
               
                    Button(action:{ isPressed2 = true}){Text("Get Started")}
                    
                        .bold()
                        .padding(12)
                        .frame(maxWidth: .infinity)
                        .background(Color("taskColor"))
                        .cornerRadius(16)
                        .padding(.horizontal,12)
                    .foregroundColor(.white).fullScreenCover(isPresented: $isPressed2, content: Register.init)}
                    
              
               
            }
        } .background(Color("BG"))
    }
}

struct screen3_Previews: PreviewProvider {
    static var previews: some View {
        screen3()
    }
}
