//
//  screen2.swift
//  my content
//
//  Created by duaa mohammed on 21/12/2022.
//

import SwiftUI

struct screen2: View {
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
                Image("sc2")
                
                .resizable()
                .frame(width: 450, height: 350)
              
            Text("Organize your tasks")
            .foregroundColor(Color("taskColor"))
                    .font(.title2)
                    .bold()
                  
              
               Spacer()
              
               
                HStack{
               
                    Button(action:{ isPressed2 = true}){Text("Next")
                        
                            .bold()
                            .padding(12)
                            .frame(maxWidth: .infinity)
                            .background(Color("taskColor"))
                            .cornerRadius(16)
                            .padding(.horizontal,12)
                            .foregroundColor(.white)
                    }.fullScreenCover(isPresented: $isPressed2, content: screen3.init)}
                    
              
               
            }
        } .background(Color("BG"))
    }
}

struct screen2_Previews: PreviewProvider {
    static var previews: some View {
        screen2()
    }
}
