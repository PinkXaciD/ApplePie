//
//  AnyTransition+Extensions.swift
//  ApplePie
//
//  Created by PinkXaciD on 2024/11/27.
//

import SwiftUI

internal extension AnyTransition {
    static func rotateWithOpacity(from endDegree: Double, to startDegree: Double) -> AnyTransition {
        return .modifier(
            active: RotateWithOpacityViewModifier(degrees: endDegree, transparent: true),
            identity: RotateWithOpacityViewModifier(degrees: startDegree, transparent: false)
        )
    }
}
