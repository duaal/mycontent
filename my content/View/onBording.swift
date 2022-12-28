//
//  onBording.swift
//  my content
//
//  Created by duaa mohammed on 21/12/2022.
//

import SwiftUI



struct onBording: View {
    @State var isPressed1 = false
    @State var isPressed = false
    var body: some View {

        VStack {
            Spacer()
            
            Button(action:{isPressed = true}){Text("Skip")}
                .foregroundColor(Color("taskColor"))
                .bold()
                .padding(.leading, 300.0)
                .fullScreenCover(isPresented: $isPressed, content: screen3.init)
            
            
            VStack{
                Spacer()
                Image("sc1")
                
                    .resizable()
                    .frame(width: 450, height: 350)
                
                Text("Less ambiguity less stress")
                    .foregroundColor(Color("taskColor"))
                    .font(.title2)
                    .bold()
                
                
                Spacer()
                
                
                HStack{
                    
                    Button(action:{ isPressed1 = true}){Text("Next")
                        
                            .bold()
                            .padding(12)
                            .frame(maxWidth: .infinity)
                            .background(Color("taskColor"))
                            .cornerRadius(16)
                            .padding(.horizontal,12)
                            .foregroundColor(.white)
                    }.fullScreenCover(isPresented: $isPressed1, content: screen2.init)
                }
                
            }
        } .background(Color("BG"))
        
    }
    
}

struct onBording_Previews: PreviewProvider {
    static var previews: some View {
        onBording()
    }
}
