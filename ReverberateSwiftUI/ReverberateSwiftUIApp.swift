//
//  ReverberateSwiftUIApp.swift
//  ReverberateSwiftUI
//
//  Created by arun-13930 on 20/05/23.
//

import SwiftUI

@main
struct ReverberateSwiftUIApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
