//
//  Main.swift
//  my content
//
//  Created by duaa mohammed on 21/12/2022.
//

import SwiftUI

struct Main: View {
    @State private var selectedTab :Tab = .house

    var body: some View {
        ZStack{
            VStack{
                TabView(selection: $selectedTab) {
                    if (selectedTab == .house){
                        NavigationView{
                            Home()}
                    }
                    else if (selectedTab == .person){
                       Profile()
                    }
                    else if (selectedTab == .chart){
                       Chart()
                    }
                }
             
            }
            VStack{
                Spacer()
                tabView(selectedTab: $selectedTab).padding(.bottom , -40).background(.thinMaterial).background(Color("taskBackground"))
            }
        }
    }
}

struct Main_Previews: PreviewProvider {
    static var previews: some View {
        Main()
    }
}
