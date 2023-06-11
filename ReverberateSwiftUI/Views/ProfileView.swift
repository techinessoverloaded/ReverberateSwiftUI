//
//  ProfileView.swift
//  ReverberateSwiftUI
//
//  Created by arun-13930 on 21/05/23.
//

import SwiftUI

struct ProfileView: View {
    
    @State private var path = NavigationPath()
    @EnvironmentObject private var globalConstants: GlobalConstants
    @EnvironmentObject private var globalVariables: GlobalVariables
    @EnvironmentObject private var appPrefsVM: AppPreferencesVM
    private var preferenceItems = ["Languages", "Music Genres"]
    
    var body: some View {
        NavigationStack(path: $path) {
            List {
                Section {
                    if !appPrefsVM.isUserLoggedIn {
                        HStack {
                            Image(systemName: globalConstants.profileImage)
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
                    ForEach(preferenceItems, id: \.self) { preferenceItem in
                        NavigationLink(value: preferenceItem) {
                            Text(preferenceItem)
                        }
                    }
                    HStack {
                        Text("Theme")
                        Spacer()
                        VStack(alignment: .trailing) {
                            Picker("", selection: $appPrefsVM.currentTheme) {
                                Text("System").tag(0)
                                Text("Light").tag(1)
                                Text("Dark").tag(2)
                            }
                            .pickerStyle(.segmented)
                            .frame(width: 200)
                        }
                    }
                } header: {
                    Text("User Preferences")
                        .listRowInsets(EdgeInsets(top: 10, leading: 5, bottom: 10, trailing: 5))
                }
            }
            .padding(.bottom, 70)
            .navigationTitle("Your Profile")
            .navigationBarTitleDisplayMode(appPrefsVM.isUserLoggedIn ? .inline : .large)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
