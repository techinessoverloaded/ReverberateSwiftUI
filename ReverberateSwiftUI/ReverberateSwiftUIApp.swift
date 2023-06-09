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
    let contextSaveAction = PersistenceController.shared.save
    let globalConstants = GlobalConstants()
    let globalVariables = GlobalVariables()
    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext).environment(\.contextSaveAction, contextSaveAction)
                .environmentObject(globalConstants)
                .environmentObject(globalVariables)
                .modifier(ThemeModifier())
        }
    }
}

private struct MyEnvironmentKey: EnvironmentKey {
    static let defaultValue: () -> Void = {}
}

extension EnvironmentValues {
    var contextSaveAction: () -> Void {
        get { self[MyEnvironmentKey.self] }
        set { self[MyEnvironmentKey.self] = newValue }
    }
}
