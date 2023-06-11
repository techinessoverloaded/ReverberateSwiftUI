//
//  AppPreferencesVM.swift
//  ReverberateSwiftUI
//
//  Created by Arunprasadh on 11/06/23.
//

import Foundation
import SwiftUI

class AppPreferencesVM: ObservableObject {
    @AppStorage("currentTheme") var currentTheme: Int = 1
    @AppStorage("isUserLoggedIn") var isUserLoggedIn: Bool = false
    @AppStorage("selectedTabIndex") var selectedTabIndex: Int = 0
}

struct ThemeModifier: ViewModifier {
    
    @ObservedObject var appPreferencesVM = AppPreferencesVM()
    
    public func body(content: Content) -> some View {
        content
            .preferredColorScheme(appPreferencesVM.currentTheme == 1 ? .light : appPreferencesVM.currentTheme == 2 ? .dark : nil)
            .environmentObject(appPreferencesVM)
    }
}
