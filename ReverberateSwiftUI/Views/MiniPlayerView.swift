//
//  MiniPlayerView.swift
//  ReverberateSwiftUI
//
//  Created by arun-13930 on 21/05/23.
//

import SwiftUI
import UIKit

struct MiniPlayerView: View {
    
    @EnvironmentObject private var globalVariables: GlobalVariables
    
    @EnvironmentObject private var globalConstants: GlobalConstants
    
    var animation: Namespace.ID
    
    var height = UIScreen.main.bounds.height / 4
    
    var safeArea = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.keyWindow?.safeAreaInsets
    
    @State var offset: CGFloat = 0
    
    @State var tempSongCurrentTime: TimeInterval = 0
    
    @State var tempSongDuration: TimeInterval = 300
    
    var body: some View {
        VStack {
            HStack(alignment: .center) {
                if globalVariables.isPlayerExpanded {
                    Button(action: {
                        changeExpansionWithSpringAnimation(newValue: false)
                    }, label: {
                        Image(systemName: globalConstants.closeIcon)
                            .font(.title2)
                            .foregroundColor(.gray)
                    })
                    .padding(.top, safeArea?.top)
                    .padding(.leading)
                    .padding(.bottom, 40)
                }
                
                Capsule()
                    .fill(Color.gray)
                    .frame(width: globalVariables.isPlayerExpanded ? 60 : 0, height: globalVariables.isPlayerExpanded ? 4 : 0)
                    .opacity(globalVariables.isPlayerExpanded ? 1 : 0)
                    .padding(.top, globalVariables.isPlayerExpanded ? safeArea?.top : 0)
                    .padding(.bottom, globalVariables.isPlayerExpanded ? 40 : 0)
                    .padding(.leading, 100)
                
            }
            
            if globalVariables.isPlayerExpanded {
                VStack {
                    Text("Playlist Name")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                        .opacity(0.8)
                        .padding(.horizontal)
                        .matchedGeometryEffect(id: "Playlist Title", in: animation)
                    
                    Button(action: {
                        changeExpansionWithSpringAnimation(newValue: false)
                    }) {
                        Text("View Playlist ›")
                            .font(.body)
                            .fontWeight(.regular)
                            .foregroundColor(.blue)
                    }
                    .padding(.horizontal)
                    .padding(.top)
                }
            }
            
            HStack(spacing: 15) {
                
                if globalVariables.isPlayerExpanded {
                    Spacer(minLength: 0)
                }
                
                Image(systemName: "person.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: globalVariables.isPlayerExpanded ? height : 35, height: globalVariables.isPlayerExpanded ? height : 35)
                    .cornerRadius(10)
                
                if !globalVariables.isPlayerExpanded {
                    Text("Not Playing")
                        .font(.body)
                        .fontWeight(.semibold)
                        .opacity(0.8)
                        .padding(.trailing)
                        .matchedGeometryEffect(id: "Song Title", in: animation)
                }
                
                Spacer(minLength: 0)
                
                if !globalVariables.isPlayerExpanded {
                    Button(action: {}, label: {
                        Image(systemName: globalConstants.previousSongIcon)
                            .font(.title3)
                            .foregroundColor(.primary)
                    })
                    .opacity(0.8)
                    
                    Button(action: {
                        globalVariables.isPlaying.toggle()
                    }, label: {
                        globalVariables.isPlaying ? Image(systemName: globalConstants.pauseIcon)
                            .font(.title2)
                            .foregroundColor(.primary) : Image(systemName: globalConstants.playIcon)
                            .font(.title2)
                            .foregroundColor(.primary)
                    })
                    .opacity(0.8)
                    .padding(.horizontal)
                    
                    Button(action: {}, label: {
                        Image(systemName: globalConstants.nextSongIcon)
                            .font(.title3)
                            .foregroundColor(.primary)
                    })
                    .opacity(0.8)
                }
            }
            .padding(.horizontal)
            
            VStack {
                HStack {
                    if globalVariables.isPlayerExpanded {
                        Text("Not Playing")
                            .font(.title2)
                            .foregroundColor(.primary)
                            .fontWeight(.semibold)
                            .opacity(0.8)                        .matchedGeometryEffect(id: "Song Title", in: animation)
                    }
                }
                .padding(.horizontal)
                .padding(.top)
                
                if globalVariables.isPlayerExpanded {
                    Button(action: {
                        
                    }, label: {
                        Text("Song Artists List ›")
                    })
                    .foregroundColor(.primary)
                    .padding(.top)
                    .padding(.horizontal)
                    .opacity(0.8)
                    
                    VStack {
                        Slider(value: $tempSongCurrentTime, in: 0.0...tempSongDuration, onEditingChanged: { isEditing in
                            if !isEditing {
                                globalVariables.audioPlayer.currentTime = tempSongCurrentTime
                            }
                        })
                        .tint(.primary)
                        .padding(.horizontal, 20)
                        
                        HStack {
                            Text("\(minimumDurationLabelText)")
                                .font(.caption)
                                .opacity(0.8)
                            
                            Spacer()
                            
                            Text("\(maximumDurationLabelText)")
                                .font(.caption)
                                .opacity(0.8)
                        }
                        .padding(.horizontal, 20)
                    }
                    
                    HStack {
                        
                    }
                }
                
                Spacer(minLength: 0)
            }
            .frame(height: globalVariables.isPlayerExpanded ? nil : 0)
            .opacity(globalVariables.isPlayerExpanded ? 1 : 0)
        }
        .frame(maxHeight: globalVariables.isPlayerExpanded ? .infinity : 70)
        .background(
            VStack(spacing: 0) {
                
                BlurView()
                
                if !globalVariables.isPlayerExpanded {
                    ProgressView(value: 0.5)
                        .tint(.primary)
                        .opacity(0.6)
                }
            }
            .onTapGesture {
                changeExpansionWithSpringAnimation(newValue: true)
            }
        )
        .padding(.bottom, 10)
        .cornerRadius(10)
        .padding(.bottom, -10)
        .cornerRadius(globalVariables.isPlayerExpanded ? 20 : 0)
        .offset(y: globalVariables.isPlayerExpanded ? 0 : -48)
        .offset(y: offset)
        .gesture(DragGesture().onEnded(onGestureValueEnd(value:)).onChanged(onGestureValueChange(value:)))
        .ignoresSafeArea()
    }
    
    func changeExpansionWithSpringAnimation(newValue: Bool) {
        withAnimation(.spring()) {
            globalVariables.isPlayerExpanded = newValue
        }
    }
    
    func onGestureValueChange(value: DragGesture.Value) {
        let translationHeight = value.translation.height
        if translationHeight > 0 && globalVariables.isPlayerExpanded {
            offset = translationHeight
        }
    }
    
    func onGestureValueEnd(value: DragGesture.Value) {
        withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.95, blendDuration: 0.95)) {
            globalVariables.isPlayerExpanded = value.translation.height < height
            offset = 0
        }
    }
    
    var minimumDurationLabelText: String {
        let currentTime = Int(tempSongCurrentTime)
        let seconds = String(format: "%02d", currentTime % 60)
        let minutes = String(format: "%02d", currentTime / 60)
        return "\(minutes):\(seconds)"
    }
    
    var maximumDurationLabelText: String {
        let duration = Int(tempSongDuration)
        let seconds = String(format: "%02d", duration % 60)
        let minutes = String(format: "%02d", duration / 60)
        return "\(minutes):\(seconds)"
    }
}
