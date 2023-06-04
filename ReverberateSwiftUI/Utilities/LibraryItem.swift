//
//  LibraryItem.swift
//  ReverberateSwiftUI
//
//  Created by arun-13930 on 04/06/23.
//

import Foundation
import UIKit

enum LibraryItem: CustomStringConvertible, Identifiable {
    
    case allSongs, allAlbums, allArtists, yourPlaylists
    
    var id: Self {
        return self
    }
    
    var description: String {
        switch self {
        case .allSongs:
            return "All Songs"
        case .allAlbums:
            return "All Albums"
        case .allArtists:
            return "All Artists"
        case .yourPlaylists:
            return "Your Playlists"
        }
    }
    
    var iconName: String {
        switch self {
        case .allSongs:
            return "music.note"
        case .allAlbums:
            return "square.stack"
        case .allArtists:
            return "music.mic"
        case .yourPlaylists:
            return "music.note.list"
        }
    }
    
    static func getAllCases(isUserLoggedIn: Bool) -> [LibraryItem] {
        var result: [LibraryItem] = [.allSongs, .allAlbums, .allArtists]
        if isUserLoggedIn {
            result.append(.yourPlaylists)
        }
        return result
    }
}
