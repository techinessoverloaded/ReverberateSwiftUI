//
//  HomeView.swift
//  ReverberateSwiftUI
//
//  Created by arun-13930 on 21/05/23.
//

import SwiftUI

struct HomeView: View {
    
    @State var path = NavigationPath()
    @State var selectedSong: Song?
    
    var body: some View {
        NavigationStack(path: $path) {
            ScrollView(.vertical) {
                Text("Home")
            }
            .navigationTitle(Text("Home"))
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
