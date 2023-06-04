//
//  GlobalVariables.swift
//  ReverberateSwiftUI
//
//  Created by arun-13930 on 21/05/23.
//

import Foundation
import SwiftUI
import AVKit

class GlobalVariables: ObservableObject {
    @Published var isPlaying: Bool = false
    @Published var isPlayerExpanded: Bool = false
    @Published var audioPlayer: AVAudioPlayer = AVAudioPlayer()
    @Published var recentlyPlayedSongNames: [String] = []
    @Published var recentlyPlayedAlbumNames: [String] = []
    @Published var isUserLoggedIn: Bool = false
}
