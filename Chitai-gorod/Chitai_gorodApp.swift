//
//  Chitai_gorodApp.swift
//  Chitai-gorod
//
//  Created by Тимур Белов  on 07.02.2025.
//

import SwiftUI

@main
struct Chitai_gorodApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
    
}
