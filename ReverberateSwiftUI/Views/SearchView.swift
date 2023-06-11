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
    private var allCategories = Category.allCasesForBrowsing
    
    var columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    // 2. Fixed height of card
    let width: CGFloat = 140
    
    var body: some View {
        NavigationStack(path: $path) {
            GeometryReader { geometry in
                ScrollView {
                    Text("Browse All")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 20)
                    LazyVGrid(columns: columns, alignment: .center, spacing: 8) {
                        ForEach(allCategories, id: \.self) { category in
                            Text(category.description)
                                .font(.body)
                                .fontWeight(.semibold)
                                .frame(width: width, height: width/3)
                                .padding(.all)
                                .background(Color.random)
                        }
                    }
                    .padding(.horizontal, 20)
                }
            }
            .padding(.bottom, 70)
            .navigationTitle("Search")
            .navigationBarTitleDisplayMode(.large)
        }
        .searchable(text: $searchString, placement: .navigationBarDrawer(displayMode: .always), prompt: "Songs, Albums, Artists")
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
