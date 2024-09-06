//
//  MatchMakingApp.swift
//  MatchMaking
//
//  Created by Shivam Ratnam on 05/09/24.
//

import SwiftUI

@main
struct MatchMakingApp: App {
    let persistenceController = PersistenceController.shared
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
