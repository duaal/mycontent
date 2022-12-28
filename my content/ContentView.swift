//
//  ContentView.swift
//  my content
//
//  Created by duaa mohammed on 12/12/2022.
//

import SwiftUI


struct ContentView: View {
    
    
    
    
    var body: some View {
     
          onBording()
            //tabView(selectedTab: $selectedTab)
            
            
            
            
            
        }
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
