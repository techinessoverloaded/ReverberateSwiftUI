//
//  ProfileView.swift
//  ReverberateSwiftUI
//
//  Created by arun-13930 on 21/05/23.
//

import SwiftUI

struct ProfileView: View {
    
    @State private var path = NavigationPath()
    @EnvironmentObject private var globalVariables: GlobalVariables
    
    var body: some View {
        NavigationStack(path: $path) {
            List {
                Section {
                    if !globalVariables.isUserLoggedIn {
                        HStack {
                            Image(systemName: "person.crop.circle.fill")
                                .imageScale(.large)
                                .font(.largeTitle)
                                .foregroundColor(.gray)
                            
                            VStack(alignment: .leading, spacing: 10) {
                                Text("Login to get a better experience")
                                    .font(.body)
                                    .foregroundColor(.blue)
                                
                                Text("Preserve favourite playlists and do more.")
                                    .font(.caption2)
                            }
                        }.padding(.vertical, 10)
                    }
                } header: {
                    Text("User Information")
                        .listRowInsets(EdgeInsets(top: 10, leading: 5, bottom: 10, trailing: 5))
                }
                Section {
                    
                } header: {
                    Text("User Preferences")
                        .listRowInsets(EdgeInsets(top: 10, leading: 5, bottom: 10, trailing: 5))
                }
            }
            Text(globalVariables.isUserLoggedIn ? "Profile" : "nO")
                .navigationTitle("Your Profile")
                .navigationBarTitleDisplayMode(globalVariables.isUserLoggedIn ? .inline : .large)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
