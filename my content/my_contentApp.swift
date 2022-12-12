//
//  my_contentApp.swift
//  my content
//
//  Created by duaa mohammed on 12/12/2022.
//

import SwiftUI

@main
struct my_contentApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
