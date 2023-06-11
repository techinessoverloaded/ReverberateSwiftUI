//
//  MainView.swift
//  ReverberateSwiftUI
//
//  Created by arun-13930 on 21/05/23.
//

import SwiftUI
import UIKit

struct MainView: View {
    
    @EnvironmentObject private var globalVariables: GlobalVariables
    @EnvironmentObject private var appPrefsVM: AppPreferencesVM
    @Namespace var animation
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
            TabView(selection: $appPrefsVM.selectedTabIndex) {
                HomeView()
                    .tabItem {
                        Image(uiImage:
                                UIImage(systemName: appPrefsVM.selectedTabIndex == 0 ? "house.fill" : "house")!)
                        Text("Home")
                    }
                    .tag(0)
                SearchView()
                    .tabItem {
                        Image(uiImage:
                                UIImage(systemName: "magnifyingglass")!)
                        Text("Search")
                    }
                    .tag(1)
                LibraryView()
                    .tabItem {
                        Image(uiImage:
                                UIImage(systemName: appPrefsVM.selectedTabIndex == 2 ? "books.vertical.fill" : "books.vertical")!)
                        Text("Library")
                    }
                    .tag(2)
                ProfileView()
                    .tabItem {
                        Image(uiImage:
                                UIImage(systemName: appPrefsVM.selectedTabIndex == 3 ? "person.fill" : "person")!)
                        Text("Profile")
                    }
                    .tag(3)
            }
            MiniPlayerView(animation: animation) 
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
