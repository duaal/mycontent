//
//  Profile.swift
//  my content
//
//  Created by duaa mohammed on 20/12/2022.
//

import SwiftUI

struct Profile: View {
    @State private var  arrow = true
    @State private var  pencil = true
   @State private var toggle = true
    var body: some View {
        
        NavigationView{
            ZStack{ Color("taskColor").ignoresSafeArea() // background color
                
                VStack(spacing: 20){
                    Image(systemName: "person.crop.circle")
                        .resizable()
                        .frame(width: 90, height: 90 )
                        .foregroundColor(.white)
                        .padding(.top, 16)
                    HStack(spacing: 20 ){
                        Button(action: {
                            self.pencil = false
                        }, label: { Image(systemName: "square.and.pencil")
                                .resizable()
                                .frame(width: 30, height: 30 )
                                .foregroundColor(.white)
                        })
                        
                        Text("UserName")
                            .font(.system(size: 24, weight: .bold, design: .rounded))
                            .foregroundColor(Color.white)
                            .padding(.trailing,44)
                        
                    }
                    Spacer()
                }
                // haeder
                VStack{
                    Rectangle()
                        .foregroundColor(.white)
                        .frame(width: 390,height: 610)
                        .cornerRadius(50)
                        .padding(.bottom, -210)
                    
                }
                VStack( alignment:.leading,spacing: 20 ) {
                    
                    // text email
                    
                    Text(verbatim:("UserEmail@icloud.com"))
                        .font(.system(size: 18, weight: .bold, design: .rounded))
                        .foregroundColor(.black)
                        .padding(.trailing, 90)
                        .frame(width: 323,height: 57)
                        .background(Color("taskBackground"))
                        .cornerRadius(12)
                    
                    
                    
                    
                    // text Reset your password
                    
                    Text("Reset your password")
                        .font(.system(size: 18, weight: .bold, design: .rounded))
                        .foregroundColor(.black)
                        .padding(.trailing, 90)
                        .frame(width: 323,height: 57).background(Color("taskBackground"))
                        .cornerRadius(12)
                    //   .padding(10.0)
                    
                    
                    
                    // text Notifications
                    HStack(alignment: .center){
                        
                        Toggle("Notifications",isOn :$toggle).font(.system(size: 18, weight: .bold, design: .rounded))
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            .padding(.leading, 28.0)
                            .padding(10.0)
                        
                        
                    }
                    .frame(width: 323,height: 57)
                    .background(Color("taskBackground"))
                    .cornerRadius(12)
                    //   .padding(.leading,10)
                    
                    
                    
                    
                    
                    // LongOut text
                    
                    
                    HStack{
                        
                        Button(action: {
                            self.arrow = false
                        }, label: { Image(systemName: "iphone.and.arrow.forward")
                            //.bold()
                                .foregroundColor(.black)
                                .font(.system(size: 21))
                        })
                        NavigationLink(destination: Register().navigationBarBackButtonHidden(true),label: {
                            Text("Log Out")
                                .font(.system(size: 16, weight: .bold, design: .rounded))
                                .frame(alignment: .leading)
                                .foregroundColor(Color("Accents"))
                        })
                        
                        
                    } //end HStack of text Notifications
                    
                }//end VStack
                .padding(.leading)
                
            }    }
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile()
    }
}
