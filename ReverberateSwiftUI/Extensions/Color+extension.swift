//
//  Color+extension.swift
//  ReverberateSwiftUI
//
//  Created by Arunprasadh on 11/06/23.
//

import Foundation
import SwiftUI

extension Color {
    static var random: Color {
        return Color(
            red: .random(in: 0.0431372549...0.56862745098),
            green: .random(in: 0.0431372549...0.56862745098),
            blue: .random(in: 0.0431372549...0.56862745098)
        )
    }
}
