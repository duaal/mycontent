//
//  Register.swift
//  my content
//
//  Created by duaa mohammed on 21/12/2022.
//

import SwiftUI

struct Register: View {
    @State var username = ""
    @State var email = ""
    @State var password = ""
    @State var confirmpassword = ""
    @State var isPressed1 = false
    @State var isPressed = false
    var body: some View {
        NavigationView{
            VStack() {
                
                Text("Register")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                    .padding(.leading)
                
                TextField("Username", text: $username)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color("BG"))
                    .cornerRadius(50.0)
                    .shadow(color: Color.black.opacity(0.08), radius: 16, x: 0.0, y: 16)
                
                TextField("Email", text: $email)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color("BG"))
                    .cornerRadius(50.0)
                    .shadow(color: Color.black.opacity(0.08), radius: 16, x: 0.0, y: 16)
                TextField("Password", text: $password)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color("BG"))
                    .cornerRadius(50.0)
                    .shadow(color: Color.black.opacity(0.08), radius: 16, x: 0.0, y: 16)
                TextField("Confirm Password", text: $confirmpassword)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color("BG"))
                    .cornerRadius(50.0)
                    .shadow(color: Color.black.opacity(0.08), radius: 16, x: 0.0, y: 16)
               
                NavigationLink("Register", destination: Main().navigationBarBackButtonHidden(true))

                    
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 270, height: 60)
                        .background(Color("taskColor"))
                        .cornerRadius(15.0).padding()
                NavigationLink(destination: Main().navigationBarBackButtonHidden(true), label: {
                    HStack {
                        
                        Image ("apple")
                            .padding()
                        
                        Text("Sign in with Apple")
                            .font(.headline)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.leading)
                    }
                    .padding()
                    .frame(width: 270, height: 60)
                    .background(Color.black)
                    .cornerRadius(15.0)
                    
                })

                
                
            
        
                
                
            }
            .padding()
            
            VStack {
                NavigationLink("Register", destination: Main())
                
                                 .font(.headline)
                                    .foregroundColor(.white)
                                    .frame(width: 220, height: 60)
                                    .background(Color("taskColor"))
                                    .cornerRadius(15.0)
                
                
                Text ("or")
                    .font(.headline)
                    .fontWeight(.bold)
                
                HStack {
                    
                    Image ("apple")
                        .padding()
                    
                    Text("Sign in with Apple")
                        .font(.headline)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.leading)
                }
                .padding()
                .frame(width: 270, height: 60)
                .background(Color.black)
                .cornerRadius(15.0)
                Text ("already have account ?")
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.leading)
                Link(destination: URL(string: "https://www.apple.com")!) {
                    Text("Log in")
                        .fontWeight(.semibold)
                        .foregroundColor(Color.orange)
                    
                }
                
                
                
            }    }
    }
}

struct Register_Previews: PreviewProvider {
    static var previews: some View {
        Register()
    }
}
