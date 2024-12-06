//
//  RotateViewModifier.swift
//  ApplePie
//
//  Created by PinkXaciD on 2024/11/27.
//

import SwiftUI

internal struct RotateWithOpacityViewModifier: ViewModifier {
    let degrees: Double
    let transparent: Bool
    
    internal func body(content: Content) -> some View {
        content
            .rotationEffect(.degrees(degrees))
            .opacity(transparent ? 0 : 1)
    }
}
