//
//  LibraryView.swift
//  ReverberateSwiftUI
//
//  Created by arun-13930 on 21/05/23.
//

import SwiftUI

struct LibraryView: View {
    
    @State private var path = NavigationPath()
    @EnvironmentObject private var globalVariables: GlobalVariables
    
    private var libraryItems: [LibraryItem] {
        return LibraryItem.getAllCases(isUserLoggedIn: globalVariables.isUserLoggedIn)
    }
    
    private var headerText: String {
        return globalVariables.isUserLoggedIn ? "Find Reverberate's Whole Collection of Songs, Albums, Artists and Playlists" : "Find your favourite Songs, Albums, Artists, Playlists and Reverberate's Whole Collection"
    }
    
    var body: some View {
        NavigationStack(path: $path) {
            List {
                Section {
                    ForEach(libraryItems) { libraryItem in
                        NavigationLink(value: libraryItem) {
                            HStack {
                                Image(systemName: libraryItem.iconName)
                                    .tint(.blue)
                                Text(libraryItem.description)
                            }
                        }
                    }
                } header: {
                    Text(headerText)
                        .textCase(.none)
                        .font(.callout)
                        .listRowInsets(EdgeInsets.init(top: 10, leading: 5, bottom: 10, trailing: 5))
                }
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Library")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct LibraryView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryView()
    }
}
