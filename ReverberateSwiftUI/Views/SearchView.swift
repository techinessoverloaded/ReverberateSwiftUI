//
//  SearchView.swift
//  ReverberateSwiftUI
//
//  Created by arun-13930 on 21/05/23.
//

import SwiftUI

struct SearchView: View {
    
    @State private var path = NavigationPath()
    @State private var searchString = ""
    @State private var searchScope: SearchScope = .songs
    
    var body: some View {
        NavigationStack(path: $path) {
            Text("Browse All")
            .navigationTitle("Search")
            .navigationBarTitleDisplayMode(.large)
        }
        .searchable(text: $searchString, placement: .navigationBarDrawer, prompt: "Songs, Albums, Artists")
        .searchScopes($searchScope, activation: .onSearchPresentation) {
            Text("Songs").tag(SearchScope.songs)
            Text("Albums").tag(SearchScope.albums)
            Text("Artists").tag(SearchScope.artists)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
