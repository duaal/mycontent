//
//  tabView.swift
//  my content
//
//  Created by duaa mohammed on 20/12/2022.
//

import SwiftUI
enum Tab: String, CaseIterable {
    case house
    case chart="chart.bar"
    case person
}
struct tabView: View {
    @Binding var selectedTab: Tab
    private var fillImage :String{
        selectedTab.rawValue + ".fill"
    }
    
    var body: some View {
        VStack{
            HStack{
                ForEach(Tab.allCases , id: \.rawValue){
                    tab in
                    Spacer()
                    Image(systemName: selectedTab == tab ? fillImage : tab.rawValue).scaleEffect(selectedTab == tab ? 1.25 :1.0).foregroundColor(selectedTab == tab ? Color("taskColor") :.gray).font(.system(size: 22)).onTapGesture{
                        withAnimation(.easeIn(duration: 0.1)){
                            selectedTab = tab
                        }
                    }
                    Spacer()
                }
            }.frame(width: nil , height: 60).background(.thinMaterial).background(Color("taskBackground")).cornerRadius(10).padding()
        }    }
}

struct tabView_Previews: PreviewProvider {
    static var previews: some View {
        tabView(selectedTab: .constant(.house))
    }
}
