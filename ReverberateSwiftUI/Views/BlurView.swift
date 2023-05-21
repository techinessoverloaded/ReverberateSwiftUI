//
//  BlurView.swift
//  ReverberateSwiftUI
//
//  Created by arun-13930 on 21/05/23.
//

import SwiftUI
import UIKit

struct BlurView: UIViewRepresentable {
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        return UIVisualEffectView(effect: UIBlurEffect(style: .systemChromeMaterial)) 
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}
